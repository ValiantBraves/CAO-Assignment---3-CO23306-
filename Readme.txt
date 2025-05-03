📌 LLVM Optimization Project
📖 Overview

This project demonstrates how LLVM IR can be used to analyze and optimize standard C code. The primary goal is to show performance improvements through various LLVM optimization passes such as mem2reg, loop-unroll, and instcombine.

Two versions of each program are generated:

    Unoptimized (compiled directly from C)

    Optimized (processed through LLVM passes)

Performance comparisons are made using Linux’s time command.
✅ Requirements

Ensure the following tools are installed on your system:

    clang

    opt (LLVM optimization tool)

    llc (LLVM static compiler)

    gcc

Install via:

sudo apt install clang llvm gcc

📁 Directory Structure

Taking Bubble Sort as example

LLVM_Codes/
│
├── Bubble_Sort/
│   ├── bubble_sort.c              # Original C code
│   ├── bubble_sort.ll             # LLVM IR (unoptimized)
│   ├── bubble_sort_opt.ll         # LLVM IR (optimized)
│   ├── bubble_sort_opt.s          # Assembly from optimized IR
│   ├── bubble_sort                # Unoptimized binary
│   ├── bubble_sort_opt            # Optimized binary

🚀 How to Run
Step-by-step (Example: Bubble Sort)

# Step into project directory
cd LLVM_Codes/Bubble_Sort

# 1. Generate LLVM IR from C source
clang -S -emit-llvm bubble_sort.c -o bubble_sort.ll

# 2. Apply optimization passes
opt -passes="mem2reg,loop-unroll,instcombine" bubble_sort.ll -S -o bubble_sort_opt.ll

# 3. Compile optimized IR to assembly
llc bubble_sort_opt.ll -o bubble_sort_opt.s

# 4. Generate optimized executable
gcc -no-pie bubble_sort_opt.s -o bubble_sort_opt

# 5. Also compile original C code for comparison
gcc -no-pie bubble_sort.c -o bubble_sort

# 6. Run and compare performance
time ./bubble_sort
time ./bubble_sort_opt

📊 Example Output

$ time ./bubble_sort
# Sorted output...
real    0m0.004s
user    0m0.004s
sys     0m0.000s

$ time ./bubble_sort_opt
# Sorted output...
real    0m0.003s
user    0m0.001s
sys     0m0.000s

📝 Notes

    The optimization effect may vary with complexity of the C program.

    The loop-unroll and instcombine passes may improve loop performance and constant folding.

    You can add more complex examples (e.g., Matrix Multiplication, Fibonacci, etc.) following the same structure.
