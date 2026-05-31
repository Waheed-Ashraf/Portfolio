import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/experience_model.dart';

const experienceList = <ExperienceModel>[
  ExperienceModel(
    company: "Computer Engine",
    role: "Flutter Developer",
    period: "2024 - Present",
    location: "Remote / Egypt",
    description:
        "Built production mobile and desktop experiences across HR, healthcare, and data-management products.",
    highlights: [
      "Shipped cross-platform apps to Google Play, App Store, and Microsoft Store.",
      "Integrated Firebase, REST APIs, location services, and AI-powered workflows.",
      "Maintained clean architecture, Bloc/Cubit state management, and responsive UI systems.",
    ],
    technologies: ["Flutter", "Bloc", "Firebase", "REST APIs", "AI"],
    accent: ColorPallet.skyColor,
  ),
  ExperienceModel(
    company: "CraftScene",
    role: "Flutter Developer",
    period: "2024",
    location: "Product Team",
    logoAsset: Assets.craftsceneLogo,
    description:
        "Contributed to a construction marketplace platform with supplier discovery, RFQ/RFP flows, and multilingual UX.",
    highlights: [
      "Implemented scalable feature screens for marketplace and project workflows.",
      "Worked with adaptive layouts and reusable components for mobile-first usage.",
      "Connected app experiences with live backend data and store-ready releases.",
    ],
    technologies: ["Flutter", "Clean Architecture", "Localization", "APIs"],
    accent: ColorPallet.pink,
  ),
  ExperienceModel(
    company: "Independent Projects",
    role: "Mobile App Developer",
    period: "2023 - Present",
    location: "Freelance / Open Source",
    description:
        "Designed and delivered polished Flutter apps, portfolio systems, and proof-of-concept products.",
    highlights: [
      "Created Firebase-backed apps with authentication, real-time updates, and notifications.",
      "Built responsive web/mobile interfaces with animation and custom UI polish.",
      "Published reusable portfolio and project code with clear data-driven structure.",
    ],
    technologies: ["Flutter Web", "Firestore", "Responsive UI", "GitHub"],
    accent: ColorPallet.lightPink,
  ),
];
