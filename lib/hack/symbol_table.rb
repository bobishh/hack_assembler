module Hack
  # class for holding intermediate symbol values
  class SymbolTable
    VAR_REGEX = /\@(?<name>\w+)/
    REGISTER_REGEX = /R(?<register_number>\d+)/

    PREDEFINED_LABELS = {
      'SCREEN' => 16_384,
      'KBD' => 24_576
    }.freeze

    def initialize
      @vars = {}
      @labels = {}.merge(PREDEFINED_LABELS)
    end

    def put_label(name, value)
      @labels[name] = value
      nil
    end

    def replace_var(string)
      matched_name = string.match(VAR_REGEX)[:name]
      "@#{infer_value(matched_name)}"
    end

    private

    def infer_value(matched_name)
      if register_var?(matched_name)
        infer_register(matched_name)
      elsif label?(matched_name)
        infer_label(matched_name)
      else
        infer_var(matched_name)
      end
    end

    def infer_label(name)
      @labels[name]
    end

    def label?(name)
      @labels[name] != nil
    end

    def infer_var(name)
      @vars[name] || new_var(name)
    end

    def new_var(name)
      value = next_var
      @vars[name] = value
      value
    end

    def next_var
      (@vars.values.sort.last || 15) + 1
    end

    def register_var?(name)
      name =~ REGISTER_REGEX && infer_register(name) < 16
    end

    def infer_register(name)
      matched = name.match(REGISTER_REGEX)
      matched[:register_number].to_i
    end
  end
end
