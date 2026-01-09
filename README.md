<p align="center">
  <img src="assets/images/logo.png" alt="Portfolio Logo" width="140"/>
</p>

<h1 align="center">Flutter Portfolio Website</h1>

<p align="center">
  A modern, responsive Flutter Web portfolio to showcase projects, skills, experience, and GitHub activity.
</p>

---

## ✨ Overview

This project is a **Flutter Web portfolio** designed to be:

- Clean & modern  
- Fully responsive (desktop & small screens)  
- Easy to customize  
- Ready for GitHub Pages deployment  

The main goal of this project is **reusability**.  
Anyone can fork it and create their own portfolio **without modifying UI code**.

---

## 🚀 Live Demo

👉 **Live Website:**  
https://waheed-ashraf.github.io/Portfolio/

---

## 🧱 Project Structure

```txt
lib/
├── core/
│   ├── helpers/
│   ├── utils/
│   │   ├── const.dart        # 🔴 Main constants & personal data
│   │   ├── app_styles.dart
│   │   └── color_pallet.dart
│   └── widgets/
│
├── modules/
│   └── home/
│       ├── data/
│       │   ├── data_source/  # 🔴 Editable portfolio data
│       │   └── models/
│       ├── presentation/
│       │   └── views/
│       │       ├── widgets/
│       │       │   ├── about_widgets/
│       │       │   ├── app_bar_widgets/
│       │       │   ├── education_and_courses_section/
│       │       │   ├── footer_section/
│       │       │   ├── github_achievements/
│       │       │   ├── projects_section/
│       │       │   ├── services_section/
│       │       │   └── skilles_section/
│       │       ├── adaptive_layout.dart
│       │       ├── desktop_layout.dart
│       │       ├── mobile_layout.dart
│       │       └── homeview.dart
│
└── main.dart

