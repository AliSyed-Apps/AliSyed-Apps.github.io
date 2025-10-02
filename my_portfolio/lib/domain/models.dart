class PortfolioData {
  const PortfolioData({
    required this.ownerName,
    required this.title,
    required this.summary,
    required this.skills,
    required this.highlights,
    required this.projects,
    required this.contacts,
  });

  final String ownerName;
  final String title;
  final String summary;
  final List<Skill> skills;
  final List<String> highlights;
  final List<Project> projects;
  final Contacts contacts;
}

class Skill {
  const Skill({required this.name, required this.proficiency});
  final String name;
  final double proficiency;
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
  });
  final String email;
  final String github;
  final String linkedin;
}
