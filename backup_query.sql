
ALTER TABLE [dbo].[Payment]
ADD FOREIGN KEY ([payment_method_id]) REFERENCES [dbo].[PaymentMethod](id);