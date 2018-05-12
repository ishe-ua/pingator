# frozen_string_literal: true

# Build instance of model from fixture's DEFAULTS.
def build(model_name, attributes = {}) # rubocop:disable AbcSize, MethodLength
  hash = begin
           path = fixtures_path + '/' + model_name.to_s.pluralize + '.yml'
           line = YAML.load(ERB.new(File.read(path)).result)['DEFAULTS'] # rubocop:disable YAMLLoad, LineLength
           instance_eval(ERB.new(line.to_s.gsub('$LABEL', 'sample')).result)
         end

  attributes.each { |key, value| hash[key] = value }

  if model_name == :account
    hash[:password] = APP::DEFAULT_PASSWORD
    hash[:password_confirmation] = APP::DEFAULT_PASSWORD
  end

  ##

  correction = lambda do |ref|
    if hash[ref].present?
      hash["#{ref}_id"] = accounts(hash[ref].to_sym).id if ref == 'account'
      hash["#{ref}_id"] = users(hash[ref].to_sym).id    if ref == 'user'
      hash["#{ref}_id"] = targets(hash[ref].to_sym).id  if ref == 'target'

      hash.delete(ref)
    end
  end

  correction.call('account')
  correction.call('user')
  correction.call('target')

  ##

  model_name.to_s
            .classify
            .constantize.new(hash)
end
