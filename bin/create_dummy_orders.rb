Order.transaction do
    (1..100).each do |i|
        Order.create(:name => "Customer #{i}", 
                     :address => "#{i} Street",
                     :email => "customer_#{i}@phocode.com",
                     :pay_type => "Bank Card")
    end
end