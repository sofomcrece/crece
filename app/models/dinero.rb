class Dinero
    def self.to_money(val)
        Money.new((sprintf "%.2f",val).tr('.', '')).format
    end
    def self.to_words(val)
        I18n.with_locale(:es) { (val).to_i.to_words }
    end
end