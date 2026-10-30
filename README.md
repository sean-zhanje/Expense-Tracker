# Expense Tracker (C)

A small command-line expense tracker written in C. It saves your expenses to a CSV file, lets you set a monthly budget, and warns you when you're getting close to (or over) it.

## Features

- **Add mode**: keep adding expenses one after another; each one is saved to the CSV immediately
- **View mode**: list all expenses, with a total and a total per category
- **Budget mode**: see this month's spending against your budget and set a new monthly budget
- **Delete mode**: remove expenses by number, as many as you want
- Warnings when you pass 80% of your monthly budget, and when you go over it
- Data is saved between runs (`expenses.csv` and `budget.txt`)

## Project structure

```
expense-tracker/
├── main.c        # menu loop, picks which mode to run
├── modes.c/.h    # add, view, budget and delete modes
├── budget.c/.h   # monthly spending total and budget warnings
├── storage.c/.h  # loading and saving expenses.csv and budget.txt
├── input.c/.h    # safe input reading, amount and date checks, today's date
├── expense.h     # Expense struct, constants and shared state
└── Makefile      # build and run commands
```

How the pieces connect: `main.c` calls the modes, and the modes use `input`, `storage` and `budget`. Only `storage.c` touches the data files.

## Requirements

- `gcc`
- `make`

On Ubuntu / WSL you can install both with:

```
sudo apt install build-essential
```

## Build and run

From inside the project folder:

```
make          # build only
./expense_tracker   # run the program
```

Or do both in one step:

```
make run
```

Other commands:

```
make clean    # remove the compiled files
```

## How to use it

When the program starts you get this menu:

```
1) add mode  2) view mode  3) budget mode  4) delete mode  5) quit
```

Type a number and press Enter.

**Add mode**
- Date: press Enter for today, or type `YYYY-MM-DD`. Type `q` to leave add mode.
- Then enter a category, a description and an amount.
- After each expense it shows your spending for that month against your budget.

**View mode**
- Prints every expense, the overall total and a total per category.

**Budget mode**
- Shows the current month's spending against your budget.
- Enter a new amount to change the budget, or press Enter to keep it.

**Delete mode**
- Shows the numbered list. Type the number to delete, or `q` to leave.

## Data files

The program creates these in the folder you run it from:

| File | Contents |
|------|----------|
| `expenses.csv` | one expense per line: `date,category,description,amount` |
| `budget.txt` | your monthly budget as a single number |

Example `expenses.csv`:

```
2026-10-29,food,kota lunch,45.50
2026-10-29,transport,uber home,120.00
```

## Notes and limits

- The budget is **monthly**. Spending is grouped by the `YYYY-MM` part of each expense's date.
- Up to 1000 expenses can be stored.
- Commas typed into a category or description are replaced with spaces so the CSV stays valid.
- Dates must be in `YYYY-MM-DD` format.

## Ideas for later

- Separate budgets per category
- Filter expenses by month
- Edit an existing expense
- Dynamic memory (`malloc`) instead of a fixed 1000-expense array
- Sort by date or amount
