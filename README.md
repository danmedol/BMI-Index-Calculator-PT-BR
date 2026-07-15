# ⚖️ IMC (BMI) Calculator (Dart Study)

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

A simple, interactive command-line application built in Dart to calculate a user's Body Mass Index (IMC/BMI) and classify it according to standard health ranges. 

> 🌐 **Note on Language:** While the documentation of this repository is written in English for global accessibility, the interactive CLI prompts and classification outputs are intentionally implemented in **Brazilian Portuguese** (my native language).

---

## 🎯 Project Goal & Motivation

This project was built as a hands-on exercise to practice **functional programming structures** and solve a classic algorithmic problem: taking user input from the terminal, converting it safely into numerical data, calculating a physical index, and branching the output based on continuous value ranges.

Beyond the basic math, this exercise served as a prime environment to master Dart's rigorous **Null Safety** mechanisms when handling raw stream inputs, which are inherently unpredictable.

---

## 🧠 Technical Deep Dive

This project was specifically designed to consolidate my understanding of two critical pillars of modern Dart development:

### 1. Mastering Null Safety & User Input (`dart:io`)
When retrieving user input via `stdin.readLineSync()`, the returned value is a nullable String (`String?`) because terminal inputs can be empty or interrupted. 
*   **Safe Parsing:** The program uses `double.tryParse()` combined with the null-coalescing operator (`?? ""`) to handle cases where the user inputs non-numeric characters or nothing at all, returning `null` instead of throwing a runtime crash.
*   **Variable Promotion:** By using a structured `if` check (`if (pesoTemporario != null && alturaTemporaria != null)`), Dart's compiler is smart enough to guarantee that these values are no longer null inside the block. This allowed me to safely **promote** the variables to non-nullable `double` types, satisfying the type system without resorting to unsafe force-unwrap operators (`!`).

### 2. Modern Pattern Matching with `switch`
Instead of writing a long chain of repetitive `if-else` statements, the codebase leverages Dart’s powerful relational pattern matching inside a `switch` block:
*   It directly evaluates logical ranges (e.g., `case >= 18.5 && <= 24.9:`) to classify the BMI value. This demonstrates an understanding of Dart’s modern control flow features that make complex branching highly readable and clean.

### 3. Nested Functional Expressions
The core calculation is isolated in a nested function (`calculoImc`) utilizing **required named parameters**. This ensures that the caller cannot mix up the order of weight and height arguments at the call site, enforcing strict API safety.

---

## 🛠️ How It Works

1.  **Input:** The application prompts the user for their weight (kg) and height (m) in the terminal.
2.  **Validation:** If both inputs are valid numbers, the variables are promoted to non-nullable types.
3.  **Calculation:** The BMI formula is executed:
    $$\text{BMI} = \frac{\text{weight}}{\text{height}^2}$$
4.  **Classification:** The computed BMI is formatted to two decimal places, and the relational `switch` determines the corresponding weight category:

| BMI Range | Classification (CLI Output) |
|---|---|
| `< 18.5` | Underweight (Desnutrição) |
| `18.5 - 24.9` | Normal Weight (Peso normal) |
| `25.0 - 29.9` | Overweight (Sobrepeso) |
| `30.0 - 34.9` | Obese Class I (Obesidade grau I) |
| `35.0 - 39.9` | Obese Class II (Obesidade grau II) |
| `≥ 40.0` | Severe Obesity (Obesidade grave) |

---

## 🚀 How to Run the Project

Make sure you have the [Dart SDK](https://dart.dev/get-dart) installed on your system.

1. Clone the repository:
   ```bash
   git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
