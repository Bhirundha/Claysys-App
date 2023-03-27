import 'dart:convert';

import 'package:claysys_portal/blocs/app_theme/theme_bloc.dart';
import 'package:claysys_portal/blocs/app_theme/theme_state.dart';
import 'package:claysys_portal/blocs/imp_contacts/contacts_bloc.dart';
import 'package:claysys_portal/models/current_openings.dart';
import 'package:claysys_portal/models/employee_info.dart';
import 'package:claysys_portal/models/imp_contacts.dart';
import 'package:claysys_portal/models/profile_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_widget/home_widget.dart';
import 'package:unicons/unicons.dart';
import '../blocs/app_theme/theme_event.dart';
import '../main.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    const HomePage(),
  ];

  int currentPageIndex = 0;

  void onTabTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPageIndex,
              onTap: onTabTap,
              elevation: 0,
              //selectedItemColor: Colors.lightBlue,
              //unselectedItemColor: Colors.grey,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(IconlyBold.home, size: 30), label: 'home'),
                const BottomNavigationBarItem(
                    icon: Icon(IconlyLight.wallet, size: 30), label: 'home'),
                const BottomNavigationBarItem(
                    icon: Icon(IconlyLight.infoSquare, size: 30),
                    label: 'home'),
                BottomNavigationBarItem(
                    label: 'home',
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        "https://www.bing.com/th?id=OIP.OOh0PWJjoab-C0l3WQs4ugHaLL&w=203&h=307&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
                        scale: 1.8,
                        width: 25,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                    ))
              ]),
        ),
        appBar: AppBar(
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          toolbarHeight: 65,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                margin: const EdgeInsets.only(top: 7),
                child: BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(
                        Icons.short_text,
                        size: 40.0,
                        //color: Theme.of(context).iconTheme,
                      ),
                      onPressed: () {
                        bool newValue = state.switchValue;
                        if (newValue == false) {
                          context.read<SwitchBloc>().add(SwitchOnEvent());
                        } else {
                          context.read<SwitchBloc>().add(SwitchOffEvent());
                        }
                      },
                    );
                  },
                )),
          ),
          title: Container(
            width: 200,
            height: 50,
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://www.claysys.com/app/themes/claysys-2019/assets/images/claysys-logo.png',
                  width: 95,
                  height: 75,
                ),
                const SizedBox(
                  width: 13,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Poratal',
                      style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 16.4,
                        fontWeight: FontWeight.w500,
                        //color: Colors.grey.shade600
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 25.0,
                    //color: Colors.grey.shade700
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfilePage(),
                  const EmployeeInfo(),
                  const SizedBox(height: 10),
                  const CurrentOpenings(),
                  // Container(
                  //   width: 400,
                  //   height: 8,
                  //   color: Colors.grey.shade200,
                  // ),
                  const ContactsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// profile

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<profile_details> item = [
    profile_details(
      image:
          'https://www.bing.com/th?id=OIP.OOh0PWJjoab-C0l3WQs4ugHaLL&w=203&h=307&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
      name: 'JOHN SMITH',
      designation: 'ID:CS0462 | Frontend Developer',
      emailid: 'johnsmith@claysys.com',
      phno: '+91 9876543210',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: item.length,
      itemBuilder: (context, i) {
        return Container(
          width: 400,
          height: 115,
          color: Theme.of(context).primaryColorDark,
          // margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                item[i].image,
                width: 110,
                height: 115,
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item[i].name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          item[i].designation,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item[i].emailid,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                item[i].phno,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 7),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 11),
                                  fixedSize: const Size(5, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.penToSquare,
                                        size: 11,
                                        color: Theme.of(context).primaryColor),
                                    Text(
                                      '\t Edit',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 13),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

// employee information

class EmployeeInfo extends StatefulWidget {
  const EmployeeInfo({Key? key}) : super(key: key);

  @override
  State<EmployeeInfo> createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  List<Employee> data = [
    Employee(leave_data: 20, emp_data: 901, approve_data: 7, pending_data: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, i) {
          return Container(
            width: 400,
            height: 200,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Colors.grey.shade50,
            //           Colors.grey.shade100,
            //           Colors.grey.shade200,
            //           Colors.grey.shade200
            //         ])),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 175,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(11))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(FontAwesomeIcons.addressCard,
                                size: 50, color: Colors.white),
                            Text(
                              data[i].leave_data.toString(),
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Leave Management",
                          style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 85.5,
                              height: 55,
                              decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(11),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[i].approve_data.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 13,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade400,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                    ),
                                    child: const Text(
                                      "Approved",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 85.5,
                              height: 55,
                              decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(11),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[i].pending_data.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 13,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: const Text(
                                      "Pending",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        backgroundColor: Colors.red,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 175,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 20, top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.list_alt,
                                      size: 35, color: Colors.white),
                                  Text(
                                    data[i].emp_data.toString(),
                                    style: const TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              const Text(
                                "Employee Information",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 175,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(11)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 5, top: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.calendar_month,
                                  size: 35, color: Colors.white),
                              Text(
                                "Holiday Calender",
                                style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// current openings

class CurrentOpenings extends StatelessWidget {
  const CurrentOpenings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(context, "Current Openings"),
          const Divider(
            height: 0,
            thickness: 0.7,
            //color: Colors.grey.shade300,
          ),
          const Openings(),
          const SizedBox(
            height: 13,
          ),
          Container(
            height: 40,
            width: 160,
            margin: const EdgeInsets.only(left: 4, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 1, left: 15),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.people_alt_outlined,
                  color: Colors.blue,
                ),
                label: const Text('Refer a friend',
                    style: TextStyle(color: Colors.blue)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.blue,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                // elevation: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Openings extends StatefulWidget {
  const Openings({Key? key}) : super(key: key);

  @override
  State<Openings> createState() => _OpeningsState();
}

class _OpeningsState extends State<Openings> {


  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
      shrinkWrap: true,
      itemCount: item.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).primaryColorDark),
          margin: const EdgeInsets.only(left: 20, top: 15),
          height: 30,
          width: 280,
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item[i].designation,
                    style: TextStyle(
                        fontSize: 16.5,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Visibility(
                    visible: item[i].isVisible,
                    child: Container(
                      height: 16,
                      width: 40,
                      decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                        color: Colors.red,
                      ),
                      child: const Text(
                        "New",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 04,
              ),
              Text(
                item[i].experience,
                style: TextStyle(
                    fontSize: 13.4,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 04,
              ),
              Text(item[i].detail,
                  style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .unselectedItemColor,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        );
      },
    )
    );
  }
}

// important contacts

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(context, "Important Contact"),
          Divider(
            height: 1,
            thickness: 0.3,
            color: Theme.of(context).dividerColor,
          ),
          const ContactList(),
        ],
      ),
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        if (state is ContactsLoadedState) {
          contact = state.imp_contacts;
        }
        return Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: contact.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 400,
                  height: 77,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColorDark,
                          radius: 27,
                          child: Image.network(
                            contact[index].image,
                            height: 50,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          contact[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        subtitle: Text(
                          contact[index].subtitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Theme.of(context).primaryColor),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(UniconsLine.phone,
                                      color: Colors.blueGrey.shade600)),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.mail_outlined,
                                      color: Colors.blueGrey.shade600)),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 4.7,
                        thickness: 0.6,
                        color: Theme.of(context).dividerColor,
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}



Widget titleWidget(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.only(left: 18.0),
    margin: const EdgeInsets.only(bottom: 10),
    child: Text(title,
        style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w700)),
  );
}
