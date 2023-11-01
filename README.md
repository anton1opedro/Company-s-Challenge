# README

# LoopCo Challenge - Seat Reservation Project

This project enables users to reserve seats in a room. It provides a simple interface for selecting and reserving seats, ensuring that each user's selections are reflected accurately and distinctly.

## Installation

1. Clone the repository to your local machine.
2. Ensure you have Ruby and Rails installed.
3. Run `bundle install` to install the necessary dependencies.
4. Set up the database by running `rails db:create`, `rails db:migrate` and `rails db:seed`.
5. Start the server using `rails s`.

## Usage

1. Navigate to the application in your web browser.
2. Select the seats you want to reserve.
3. Click the "Reserve" button to confirm your selection.

## Bugs

This project isn't fully functional as required. I had some difficulties with the usage of the tabs/session_id as different users.
1. When a user select a bunch of seats, they appear as selected_by_other (lightcoral color) in the other views but if another user selects a seat, all the previous seats selected_by_other (lightcoral color) turn selected (gray).   

## Contact

For any questions or inquiries, please email ap.sousa2001@gmail.com


