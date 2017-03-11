require 'hack/instruction'
require 'hack/symbol_table'

require 'pry'

module Hack
  # parser class
  class Parser
    LABEL_REGEX = /\((?<name>[.\w]+)\)/
    VAR_REGEX = /\@[a-zA-Z]+/

    def initialize(filename)
      @filename = filename
      @symbol_table = SymbolTable.new
    end

    def parsed
      @parsed ||= parse(desymbolized)
    end

    def desymbolized
      @desymbolized ||= process_symbols(prepared)
    end

    def prepared
      @prepared ||= prepare(@filename)
    end

    private

    def process_symbols(rows)
      rows.each_with_object(index: 0, desymbolized: []) do |row, acc|
        if row =~ LABEL_REGEX
          matched = row.match(LABEL_REGEX)
          @symbol_table.put_label(matched[:name], acc[:index])
        else
          acc[:desymbolized].push row
          acc[:index] += 1
        end
      end[:desymbolized]
    end

    def parse(rows)
      rows.map do |row|
        parse_row row
      end
    end

    def parse_row(row)
      row = @symbol_table.replace_var(row) if row =~ VAR_REGEX
      Instruction.build(row)
    end

    def prepare(filename)
      File.read(filename).split("\r\n").map do |row|
        wiped = row.gsub(/(\s+)/, '').gsub(%r{//.*}, '')
        wiped if wiped != ''
      end.compact
    end
  end
end
