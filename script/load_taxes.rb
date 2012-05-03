TaxRate.transaction do
	TaxRate.create(:state => 'MD', :tax_name => 'F', :rate => 0.05)
	TaxRate.create(:state => 'MD', :tax_name => 'D', :rate => 0.06)
	TaxRate.create(:state => 'VA', :tax_name => 'F', :rate => 0.04)
	TaxRate.create(:state => 'VA', :tax_name => 'D', :rate => 0.025)
end