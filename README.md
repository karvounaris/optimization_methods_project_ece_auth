# 🔍 Optimization Methods Project

## 📖 Overview
This repository contains three assignments completed as part of the Optimization Methods course at Aristotle University of Thessaloniki. Each assignment focuses on different optimization techniques and their application to specific problems. The assignments were implemented using MATLAB, and the results showcase the effectiveness and limitations of various optimization algorithms.

---

## 🧩 Assignment 1: Unconstrained Optimization Methods

### 🎯 Goals
- Compare and analyze the performance of the following methods:
  - **🔎 Dichotomous Search**
  - **📐 Golden Section Search**
  - **🔢 Fibonacci Search**
  - **📉 Derivative-Based Dichotomous Search**
- Evaluate their convergence behavior for different functions and parameter settings.

### ✨ Features
- Application of the methods to three distinct functions.
- Analysis of the impact of varying step sizes (`l`) and tolerances (`ε`) on convergence.
- Visualizations of convergence patterns and computational efficiency.

### 🏆 Results
- The methods provided consistent results across different functions, with faster convergence observed for larger step sizes (`l`).
- The Golden Section and Fibonacci methods showed similar performance, with slight variations in computational steps.
- Derivative-based methods highlighted the role of function properties in algorithmic efficiency.

---

## 🧩 Assignment 2: Constrained Optimization with Gradient-Based Methods

### 🎯 Goals
- Optimize the objective function: 

  	**f(x, y) = x^5 * exp(-x² - y²)**

- Compare the performance of:
  - **📉 Steepest Descent**
  - **📊 Newton's Method**
  - **⚙️ Levenberg–Marquardt Algorithm**

### ✨ Features
- Analysis of convergence from different initial points.
- Evaluation of step-size selection strategies:
  - Fixed step size
  - Line search minimizing `f(xk + γk * dk)`
  - Armijo rule-based step size.
- Application to both constrained and unconstrained scenarios.

### 🏆 Results
- **Steepest Descent**: Effective for some initial points but sensitive to local optima.
- **Newton's Method**: Limited by the requirement of a positive definite Hessian matrix.
- **Levenberg–Marquardt Algorithm**: Improved robustness, converging to global optima in challenging scenarios.

---

## 🧩 Assignment 3: Optimization with Equality and Inequality Constraints

### 🎯 Goals
- Minimize the objective function: 

  	**f(x1, x2) = (1/3)x1² + 3x2²**

  Subject to constraints: 
  - **-10 ≤ x1 ≤ 5**
  - **-8 ≤ x2 ≤ 12**

- Explore the behavior of the Steepest Descent algorithm under varying constraints and parameter settings.

### ✨ Features
- Simulation of unconstrained and constrained optimization scenarios.
- Analysis of parameter sensitivity (e.g., `sk`, `γk`, and initial points).
- Implementation of custom adjustments to ensure feasibility within constraints.

### 🏆 Results
- Parameter tuning is crucial for convergence under constraints.
- Inappropriate step size (`sk`) led to divergence or suboptimal solutions.
- Adjustments to ensure feasibility improved the algorithm’s reliability.

---

## 📂 Repository Contents
- **📄 Assignment Reports**:
  - [Assignment 1 Report](./Project_1.pdf)
  - [Assignment 2 Report](./Project_2.pdf)
  - [Assignment 3 Report](./Project_3.pdf)
- **💻 Code**: MATLAB scripts for the implementation and analysis of optimization methods.

---

Thank you for exploring this project! 🚀 Feel free to raise issues or contribute to improve the repository. 😊
