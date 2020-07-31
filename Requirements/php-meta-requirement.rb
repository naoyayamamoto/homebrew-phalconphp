require File.join(File.dirname(__FILE__), 'homebrew-php-requirement')

class PhpMetaRequirement < HomebrewPhpRequirement
  if $supported_php_versions.nil?
    $supported_php_versions = %w{php53 php54 php55 php56 php70 php72 php71}
  end

  if Formula["php53"].linked_keg.exist? && $supported_php_versions.include?('php53')
    default_formula "php53"
  elsif Formula["php54"].linked_keg.exist? && $supported_php_versions.include?('php54')
    default_formula "php54"
  elsif Formula["php55"].linked_keg.exist? && $supported_php_versions.include?('php55')
    default_formula "php55"
  elsif Formula["php56"].linked_keg.exist? && $supported_php_versions.include?('php56')
    default_formula "php56"
  elsif Formula["php@7.0"].linked_keg.exist? && $supported_php_versions.include?('php@7.0')
    default_formula "php@7.0"
  elsif Formula["php@7.1"].linked_keg.exist? && $supported_php_versions.include?('php@7.1')
    default_formula "php@7.1"
  elsif Formula["php@7.2"].linked_keg.exist? && $supported_php_versions.include?('php@7.2')
    default_formula "php@7.2"
  elsif Formula["php@7.3"].linked_keg.exist? && $supported_php_versions.include?('php@7.3')
    default_formula "php@7.3"
  else
    default_formula $supported_php_versions.last
  end

  def satisfied?
    $supported_php_versions.any? do |php|
        f = Formula[php]
        if f.linked_keg.exist?
          return true
        end
    end

    return false
  end

  def message
    "Missing a core php install from homebrew-php. Please run: brew link php56"
  end
end
