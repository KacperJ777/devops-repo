import random
from logo_blackjack import logo


# Function randomly returning the card
def deal_card():
    cards = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    card = random.choice(cards)
    return card


# Calculate if blackjack occured. Check if there is an ace.
def calculation_score(cards):
    if sum(cards) == 21 and len(cards) == 2:
        return 0
    if 11 in cards and sum(cards) > 21:
        cards.remove(11)
        cards.append(1)
    return sum(cards)


# Functions that compares results, as we can see the name of the parameters can differ
def compare(user_result, computer_result):
    if user_result == computer_result:
        return "Draw"
    elif computer_result == 0:
        return "PC won"
    elif user_result == 0:
        return "User won"
    elif user_result > 21:
        return "You went over. You lose"
    elif computer_result > 21:
        return "PC went over, you won!"
    elif user_result > computer_result:
        return "User won"
    else:
        return "You lose"

def play_game():
    print(logo)
    # List for storing points
    user_cards = []
    computer_cards = []

    # Appending values to user and computer lists
    for x in range(2):
        user_cards.append(deal_card())
        computer_cards.append(deal_card())

    is_game_over = False
    while not is_game_over:
        user_score = calculation_score(user_cards)
        computer_score = calculation_score(computer_cards)
        print(f"Your cards {user_cards}, current score {user_score}.")
        print(f"Computer 1st card: {computer_cards[0]}")
        if user_score == 0 or computer_score == 0 or user_score > 21:
            is_game_over = True
        else:
            another_card = input("Another card? Type 'y' or 'n' to pass.").lower()
            if another_card == "y":
                user_cards.append(deal_card())
            else:
                is_game_over = True

    while computer_score != 0 and computer_score < 17:
        computer_cards.append(deal_card())
        computer_score = calculation_score(computer_cards)

    print(f"Your final hand is: {user_cards}, final score: {user_score}")
    print(f"Computer's final hand {computer_cards}, final score {computer_score}")
    compare(user_score, computer_score)

while input("Another game? Type 'y' or 'n' to pass.") == "y":
    play_game()


