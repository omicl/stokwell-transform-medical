# Hybrid Feature Extraction Using Stockwell Transform for Medical Images

This repository contains the source code for a hybrid classical-quantum model used for feature extraction from medical images, based on the methods described in our [Scientific Reports article (Nature)](https://www.nature.com/articles/s41598-024-58274-6?fromPaywallRec=false).

---

## 📌 Project Summary

This project proposes a feature extraction method based on the Stockwell Transform (S-Transform) for processing ECG images from the [PhysioNet 2022 Moody Challenge](https://moody-challenge.physionet.org/2022/). The extracted features are then used in a classification pipeline to aid in automated diagnosis.
## 📥 Download Dataset

You can download the dataset used in this project using the following commands:

**Using `wget` in terminal:**

wget -r -N -c -np https://physionet.org/files/challenge-2022/1.0.0/

Using AWS CLI (Amazon Web Services)

aws s3 sync --no-sign-request s3://physionet-open/challenge-2022/1.0.0/ DESTINATION

## 📂 Folder Structure

project-code/
│
├── python-code/         # Contains Jupyter notebooks and Python scripts
│   └── ...              # (Hybrid model, post-processing, etc.)
│
├── matlab-code/         # Pre-processing and S-Transform implementation in MATLAB
│   └── ...              # (.m files and helper scripts)
│
└── README.md            # This file

---

## 🧠 Dataset & Challenge

- **Dataset:** Provided by the 2022 PhysioNet/CinC Challenge.
- **Format:** Multi-label classification of ECG signals.
- **Goal:** Accurately classify cardiac conditions using image-based transformations of ECG signals.

---

## 🚀 How to Use

1. MATLAB scripts in `matlab-code/` handle the initial pre-processing and S-Transform.
2. Extracted feature data is then processed using Python code in `python-code/`.
3. Python notebooks include steps for classification, feature dimensionality reduction, and evaluation.

---

## 🔧 Requirements

- Python 3.8+
- Jupyter Notebook
- NumPy, SciPy, Matplotlib
- Scikit-learn
- MATLAB (for `.m` scripts)

---

## 📜 License

Please refer to the LICENSE file (to be added) or contact the author for usage permissions.

---

## ✍️ Author

Omid Dehghan Manshadi  
This code is part of a research article published in *Scientific Reports (Nature)*.
