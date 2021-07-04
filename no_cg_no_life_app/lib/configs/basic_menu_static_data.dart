import 'package:no_cg_no_life_app/enums/RedirectionTypeEnum.dart';
import 'package:no_cg_no_life_app/models/RedirectionCardModel.dart';

class BasicMenuStaticData{
  static const RedirectionCardModel QuickLinks = const RedirectionCardModel.constant(title: "Quick Links", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
      children: <RedirectionCardModel>[
        // Academic calendar
        const RedirectionCardModel.constant(title: "Academic Calendar", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
        children: [
          RedirectionCardModel.constant( title: "Undergraduate (Spring-2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/spring-2021-undergraduate-programs" ),
          RedirectionCardModel.constant( title: "Undergraduate Exam (Spring-2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/exams-schedule-spring-2021-undergraduate-programs" ),
          RedirectionCardModel.constant( title: "Undergraduate (Summer 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/summer-2021" ),
          RedirectionCardModel.constant( title: "Undergraduate Exam (Summer 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/summer-2021-exam-schedule" ),
          RedirectionCardModel.constant( title: "Graduate (Spring 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/spring-2021-graduate-programs" ),
          RedirectionCardModel.constant( title: "Graduate (Summer 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/summer-2021-Graduate-Programs" ),
          RedirectionCardModel.constant( title: "B.Pharm (Spring 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/b-pharm-spring-2021" ),
          RedirectionCardModel.constant( title: "M.Pharm (Spring 2021)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/academic-calendar-details/m-pharm-spring-2021" ),

        ]),


        // Student Portal
        const RedirectionCardModel.constant(title: "Student Portal", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://portal.ewubd.edu/" ),
        // Scholarships and Financial Aids.
        const RedirectionCardModel.constant(title: "Scholarships and Financial Aids", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/scholarships-financial-aid" ),
        // EWU News
        const RedirectionCardModel.constant(title: "EWU News", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fbe.ewubd.edu/news" ),
        // Grading system
        const RedirectionCardModel.constant(title: "Grading System", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/grades-rules-and-regulations" ),

        // Departments
        const RedirectionCardModel.constant(title: "Departments", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/departments",
            children: <RedirectionCardModel>[
              RedirectionCardModel.constant( title: "Business Administration", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fbe.ewubd.edu/business-administration" ),
              RedirectionCardModel.constant( title: "Civil Engineering", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/civil-engineering" ),
              RedirectionCardModel.constant( title: "Computer science and Engineering", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/computer-science-engineering" ),
              RedirectionCardModel.constant( title: "Economics", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fbe.ewubd.edu/economics-department" ),
              RedirectionCardModel.constant( title: "Electrical and Electronic Engineering", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/electrical-electronic-engineering" ),
              RedirectionCardModel.constant( title: "English", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/english-department" ),
              RedirectionCardModel.constant( title: "Electronics and Communications Engineering", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/electronics-communications-engineering" ),
              RedirectionCardModel.constant( title: "Genetic Engineering and Biotechnology", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/genetic-engineering-biotechnology" ),
              RedirectionCardModel.constant( title: "Information Studies and Library Management", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/information-studies-library-management" ),
              RedirectionCardModel.constant( title: "Law", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/law-department" ),
              RedirectionCardModel.constant( title: "Mathematical and Physical Sciences", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/mathematical-physical-science" ),
              RedirectionCardModel.constant( title: "MBA & EMBA Programs", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fbe.ewubd.edu/masters-of-business-administration" ),
              RedirectionCardModel.constant( title: "Pharmacy", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/pharmacy-department" ),
              RedirectionCardModel.constant( title: "Social Relations", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/social-relations-department" ),
              RedirectionCardModel.constant( title: "Sociology", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/sociology-department" ),
              // RedirectionCardModel.constant( title: "department", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
            ]),

        // EWU Clubs
        const RedirectionCardModel.constant(title: "EWU Clubs", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/ewu-clubs",
        children: [
          RedirectionCardModel.constant( title: "Agro Industralization Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Creative Marketing", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Club For Performing Arts", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Business Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Debating Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Robotics Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "English Conversation Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Environmental and Social Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Investment and Finance Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "IEEE Student Branch", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Model United nations Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Photography Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Rotract Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Science Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Sociology Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Sports Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Telecommunication Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Computer Programming Club (EWUCoPC)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Cartter Counceling Center (CCC)", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
          RedirectionCardModel.constant( title: "Pharmacy Club", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "departmentUrl" ),
        ]),

        // Admission
        const RedirectionCardModel.constant(title: "Admission", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/admission",
        children: [
          RedirectionCardModel.constant( title: "Undergraduate", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
          children: [
              RedirectionCardModel.constant( title: "Graduate Programs", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/graduate-programs" ),
              RedirectionCardModel.constant( title: "Fees", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/graduate-programs-tuition-fees" ),
              RedirectionCardModel.constant( title: "Date and Dadeline", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/graduate-dates-deadline" ),
              RedirectionCardModel.constant( title: "Apply", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://admission.ewubd.edu/" ),
          ]),
          RedirectionCardModel.constant( title: "Graduate", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
          children: [
            RedirectionCardModel.constant( title: "Undergraduate Programs", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/undergraduate-programs" ),
            RedirectionCardModel.constant( title: "Fees", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/undergraduate-tuition-fees" ),
            RedirectionCardModel.constant( title: "Date and Dadeline", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/undergraduate-dates-deadline" ),
            RedirectionCardModel.constant( title: "Apply", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://admission.ewubd.edu/" ),
          ]),
        ]),

        // Faculty
        const RedirectionCardModel.constant(title: "Faculties", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
          children: [
            RedirectionCardModel.constant( title: "Faculty of Sciences and Engineering", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fse.ewubd.edu/" ),
            RedirectionCardModel.constant( title: "Faculty of Liberal Arts and Social Sciences", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://flass.ewubd.edu/" ),
            RedirectionCardModel.constant( title: "Faculty of Business and Economics", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://fbe.ewubd.edu/" ),
          ]
        ),


        // Alumni
        const RedirectionCardModel.constant(title: "Alumni", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://alumni.ewubd.edu/" ),
        // Library
        const RedirectionCardModel.constant(title: "Library", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.PageRedirection, url: "/quick-links",
          children: [
            RedirectionCardModel.constant( title: "Library Home", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "http://lib.ewubd.edu/" ),
            RedirectionCardModel.constant( title: "Library Membership", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "http://lib.ewubd.edu/page/library-membership-online-application" ),
          ]
        ),
        // Campus Life
        const RedirectionCardModel.constant(title: "Campus Life", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/campus-life" ),
        // Student Ethics & Academic Decipline
        const RedirectionCardModel.constant(title: "Student Ethics & Academic Discipline", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/student-rules-regulation" ),
        // Faculty Members publications
        const RedirectionCardModel.constant(title: "Faculty Members Publications", imagePath:  "assets/icons/cgpa.png", redirectionType: RedirectionType.URLRedirection, url: "https://www.ewubd.edu/journal-and-publications" ),
      ]);
}