class Contact {
  final String title;
  final String subtitle;
  final String image;

  Contact ({required this.title, required this.subtitle, required this.image});
}

List<Contact> contact = [
  Contact(
      title: "Jordan Smet",
      subtitle: "HR Manager",
      image:
      "https://th.bing.com/th/id/R.ea3a079fa3aa9117a47ab9c1f47fbe95?rik=1ueBtWdAJYldnQ&riu=http%3a%2f%2fthemusclemedics.com%2fwp-content%2fuploads%2f2018%2f04%2fCircle-Profile-PNG.png&ehk=gifQH7wqp06aLJgzmt0z0RkYw8OieqF%2babLq1DgjMfo%3d&risl=&pid=ImgRaw&r=0"),
  Contact(
      title: "Christina Jensen",
      subtitle: "Account Manager",
      image:
      "https://connectconferences.com/wp-content/uploads/sites/2/2018/10/Darcie-Fankhauser.png"),
  Contact(
      title: "Gerrit Kramer",
      subtitle: "IT Manager",
      image:
      "https://i0.wp.com/www.zachdrewshow.com/wp-content/uploads/2018/08/Zach-Drew-bio-pic.png?resize=399%2C399&ssl=1"),
];