class MyMailer < ApplicationMailer

default from: "pinkumargale1996@gmail.com"


def test_mail
mail(to: "pinkumargale1996@gmail.com",subject: "Your Ticket has been updated:!")

end
end