class PortfolioData {
  const PortfolioData({
    required this.ownerName,
    required this.image,
    required this.title,
    required this.summary,
    required this.skills,
    required this.highlights,
    required this.projects,
    required this.experiences,
    required this.education,
    required this.certifications,
    required this.contacts,
  });

  final String ownerName;
  final String image;
  final String title;
  final String summary;
  final List<Skill> skills;
  final List<String> highlights;
  final List<Project> projects;
  final List<Experience> experiences;
  final List<Education> education;
  final List<Certification> certifications;
  final Contacts contacts;
}

class Skill {
  const Skill({required this.name, required this.proficiency, this.image});
  final String name;
  final double proficiency;
  final String? image;
}

class Project {
  const Project({required this.title, required this.description, this.link});
  final String title;
  final String description;
  final String? link;
}

class Contacts {
  const Contacts({
    required this.email,
    required this.github,
    required this.linkedin,
    required this.phone,
  });
  final String email;
  final String github;
  final String linkedin;
  final String phone;
}

class Experience {
  const Experience({
    required this.company,
    required this.locationType,
    required this.period,
    required this.roles,
    required this.image,
  });
  final String company;
  final String locationType; // e.g., On-site, Remote, Hybrid
  final String period; // e.g., Mar 2022 - Present
  final List<Role> roles;
  final String? image;
}

class Role {
  const Role({
    required this.title,
    required this.period,
    required this.bullets,
  });
  final String title;
  final String period;
  final List<String> bullets;
}

class Education {
  const Education({
    required this.institution,
    required this.degree,
    required this.period,
  });
  final String institution;
  final String degree;
  final String period;
}

class Certification {
  const Certification({
    required this.title,
    required this.issuer,
    required this.period,
  });
  final String title;
  final String issuer;
  final String period;
}
