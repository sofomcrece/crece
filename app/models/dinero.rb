class Dinero
    def self.to_money(val)
        Money.new((sprintf "%.2f",val).tr('.', '')).format
    end
end