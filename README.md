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
```




  <hr />

  <h2>🛠️ How to Customize (Very Simple)</h2>

  <h3>1️⃣ Update Personal Information</h3>
  <p>Edit the following file:</p>
  <pre><code>lib/core/utils/const.dart</code></pre>

  <p>You can customize:</p>
  <ul>
    <li>Name</li>
    <li>Email</li>
    <li>WhatsApp number</li>
    <li>CV URL</li>
    <li>GitHub username</li>
    <li>Social links</li>
  </ul>

  <hr />

  <h3>2️⃣ Update Portfolio Content</h3>
  <p><strong>Edit data only</strong> (UI updates automatically):</p>
  <pre><code>lib/modules/home/data/data_source/</code></pre>

  <p>You can update:</p>
  <ul>
    <li>Projects</li>
    <li>Skills</li>
    <li>Services</li>
    <li>Education &amp; Courses</li>
    <li>Achievements</li>
  </ul>

  <hr />

  <h3>3️⃣ Update Images &amp; Icons</h3>
  <p>Replace files inside:</p>
  <pre><code>assets/images/
assets/icons/</code></pre>

  <p>Then update image paths in:</p>
  <pre><code>lib/core/utils/app_images.dart</code></pre>

  <hr />

  <h2>📱 Responsive Design</h2>
  <p>This portfolio is <strong>fully responsive</strong> across all screen sizes:</p>
  <ul>
    <li>Desktop</li>
    <li>Tablets</li>
    <li>Small screen browsers</li>
  </ul>

  <h3>Technologies used:</h3>
  <ul>
    <li><code>AdaptiveLayout</code></li>
    <li><code>LayoutBuilder</code></li>
    <li><code>MediaQuery</code></li>
  </ul>

  <p>📌 Mobile experience includes <strong>Drawer navigation</strong> with smooth scrolling.</p>

  <hr />

  <h2>🧰 Tech Stack</h2>
  <ul>
    <li>Flutter Web</li>
    <li>Dart</li>
    <li>animate_do</li>
    <li>flutter_svg</li>
    <li>dio</li>
    <li>GitHub Pages</li>
  </ul>

  <hr />

  <h2>🚀 Deployment (GitHub Pages)</h2>

  <h3>Build the web project</h3>
  <pre><code>flutter build web --release --base-href "/Portfolio/"</code></pre>

  <h3>Deploy</h3>
  <p>Push the contents of:</p>
  <pre><code>build/web</code></pre>

  <p>To one of the following:</p>
  <ul>
    <li><code>gh-pages</code> branch</li>
    <li><code>/docs</code> folder (configured in GitHub Pages settings)</li>
  </ul>

  <p>Then enable <strong>GitHub Pages</strong> from the repository settings.</p>

  <hr />

  <h2>▶️ Usage</h2>

  <h3>Install dependencies</h3>
  <pre><code>flutter pub get</code></pre>

  <h3>Run locally</h3>
  <pre><code>flutter run -d chrome</code></pre>

  <h3>Build for production</h3>
  <pre><code>flutter build web --release</code></pre>

  <hr />

  <h2>👨‍💻 Author</h2>
  <p>
    <strong>Waheed Ashraf</strong><br />
     Software Engineer – Flutter Developer
  </p>
  <p>
    GitHub: <a href="https://github.com/Waheed-Ashraf" target="_blank" rel="noopener noreferrer">
      https://github.com/Waheed-Ashraf
    </a>
  </p>

  <hr />

  <h2>📌 Final Note</h2>
  <p>This portfolio is intentionally built to be:</p>
  <ul>
    <li>✅ Clean</li>
    <li>✅ Scalable</li>
    <li>✅ Easy to personalize</li>
  </ul>

  <p>
    👉 To customize it, you only need to modify <strong>data files and constants</strong> —
    <strong>no UI refactoring required</strong>.
  </p>

  <p>If you like this project, feel free to ⭐ the repository and adapt it for your own use.</p>







