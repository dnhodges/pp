xml.instruct!
xml.report(:month => @month, :year=> @year) do
  @order.keys.sort.each do |day|
      xml.date(:id => day.strftime("%m/%d/%Y")) do
        xml.sales @order[day].collect(&:price).sum.truncate(2)
    end
  end
end