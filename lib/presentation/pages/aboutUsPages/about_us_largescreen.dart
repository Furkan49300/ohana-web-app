import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_text_block.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/partners_carousel.dart';

class AboutUsLargeScreen extends StatefulWidget {
  AboutUsLargeScreen({super.key});

  @override
  State<AboutUsLargeScreen> createState() => _AboutUsLargeScreenState();
}

class _AboutUsLargeScreenState extends State<AboutUsLargeScreen> {
  final Map<String, dynamic> companyShowingUp = {
    'title': 'OHana Entreprise',
    'body': [
      {
        'title': '',
        'paragraph':
            "Fondée en 2021, OHana Entreprise est née de la vision de fournir des solutions informatiques innovantes et personnalisées à ses clients. Depuis ses débuts, l'entreprise s'est engagée à être un acteur dynamique dans le domaine des technologies de l'information. En seulement quelques années, OHana Entreprise a réussi à se forger une réputation solide grâce à son engagement envers l'innovation, la qualité et la satisfaction client.",
      },
      {
        'title': '',
        'paragraph':
            "L'histoire de OHana Entreprise est marquée par une croissance constante et une adaptation continue aux évolutions technologiques et aux besoins de ses clients. Dès le départ, l'entreprise a misé sur l'importance de rester à la pointe de l'innovation. Cette orientation a permis à OHana Entreprise de développer des solutions uniques et efficaces, répondant aux défis complexes de ses clients.",
      },
      {
        'title': '',
        'paragraph':
            "L'une des forces d'OHana Entreprise réside dans sa capacité à personnaliser ses solutions pour chaque client. Cette approche sur mesure est rendue possible grâce à une équipe diversifiée de professionnels passionnés. Chacun des membres de l'équipe apporte une expertise unique, créant ainsi une synergie qui se traduit par des solutions innovantes et robustes.",
      },
      {
        'title': '',
        'paragraph':
            "La diversité des talents au sein de OHana Entreprise est un atout majeur. L'entreprise rassemble des experts en développement de logiciels, en applications web et mobiles, ainsi qu'en cybersécurité. Cette diversité permet à OHana Entreprise de proposer des solutions complètes et intégrées, répondant à un large éventail de besoins et de défis.",
      },
      {
        'title': '',
        'paragraph':
            "Depuis sa création, OHana Entreprise a également accordé une grande importance à la collaboration avec ses partenaires. Ces partenariats stratégiques renforcent l'offre de l'entreprise, en apportant des compétences et des ressources supplémentaires. Grâce à ces collaborations, OHana Entreprise est en mesure de proposer des solutions encore plus complètes et performantes.",
      }
    ]
  };

  bool isOnDetails = false;
  _removeBoxOfDteails() {
    setState(() {
      isOnDetails = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color blackColorwhiteOpacity = Colors.black.withOpacity(0.5);
    ColorFilter colorFilter = ColorFilter.mode(
        isOnDetails ? blackColorwhiteOpacity : Colors.transparent,
        BlendMode.srcATop);
    return Scaffold(
      backgroundColor: isOnDetails ? blackColorwhiteOpacity : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, navBarHeight),
        child: ColorFiltered(
            colorFilter: colorFilter,
            child: const NavigationBarContentsLargeScreen()),
      ),
      body: Expanded(
        child: SizedBox(
            width: screenSize.width,
            child: Stack(
              children: [
                // CONTENT
                GestureDetector(
                  onTap: () {
                    context.read<DropdownMenuBloc>().add(HideMenuEvent());
                    _removeBoxOfDteails();
                  },
                  child: ColorFiltered(
                    colorFilter: colorFilter,
                    child: SingleChildScrollView(
                      child: _content(screenSize, context),
                    ),
                  ),
                ),
                // NAVBAR MEGA-DROPDOWN MENUS
                const DropdownMenuExpertises(),
                const DropdownMenuOffers(),
                const DropdownMenuAboutUs(),
                if (isOnDetails)
                  BoxOfDetails(
                    content: companyShowingUp,
                    onBack: () {
                      _removeBoxOfDteails();
                    },
                  ),
                //SEARCH BAR
                const SearchNavBar(
                  placeholder:
                      "Cherchez une page, un service, un article, une offre d'emploi...",
                )
              ],
            )),
      ),
    );
  }

  _content(Size screenSize, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomBanner(
            imagePath: 'assets/about_us_image/main_background_image.jpg'),
        const SizedBox(height: 40),
        _getAboutUsText(companyShowingUp['body'][0]['paragraph']),
        const SizedBox(height: 40),
        _getOurSites(screenSize.width),
        const SizedBox(height: 70),
        _getOurValues(),
        const SizedBox(height: 70),
        _getOurTeamWork(screenSize.width),
        const SizedBox(height: 70),
        const PartnersCarousel(title: 'Nos Partners'),
        const SizedBox(height: 70),
        _getLocalisation(),
        const SizedBox(height: 70),
        const Footer()
      ],
    );
  }

//Text about us

  _getAboutUsText(paragraphOne) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: spaceLeftBigTitle,
          ),
          CustomUnderlineTitle(
            title: 'Notre Entreprise',
          )
        ]),
        const SizedBox(
          height: spaceBetweenBigTitleAndTextBody,
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 1.5 * spaceLeftBigTitle, right: 1.5 * spaceLeftBigTitle),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldTextCustomizer(
                text: paragraphOne,
                boldTextList: const ['OHana Entreprise'],
                boldListTextMode: true,
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOnDetails = true;
                  });
                },
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    '... Découvrer plus!',
                    style: TextStyle(color: purpleNeutral, fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  //----OUR SITES

  _getOurSites(mediaScreenWidth) {
    List<Map<String, dynamic>> ourSites = [
      {
        'place': 'Europe',
        'image': 'assets/about_us_image/ou-partir-en-europe.jpg',
        'text':
            "Lorem ipsum dolor,  sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepequod autem iure Lorem ipsum dolor,sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepe quod autem iure repudiandae assumenda dolore eos blanditiis officiis tempora, corporis sit cum  placeat eveniet!",
        'boldTextList': ['elit', 'accusamus perferendis']
      },
      {
        'place': 'Cameroun',
        'image':
            'assets/about_us_image/xlarge_moraine_lake_1473669_388bdcff0e.jpg',
        'text':
            "Lorem ipsum dolor,  sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepequod autem iure Lorem ipsum dolor,sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepe quod autem iure repudiandae assumenda dolore eos blanditiis officiis tempora, corporis sit cum  placeat eveniet!",
        'boldTextList': ['elit', 'accusamus perferendis']
      },
      {
        'place': 'Afrique',
        'image': 'assets/about_us_image/expatrier-en-afrique.jpg',
        'text':
            "Lorem ipsum dolor,  sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepequod autem iure Lorem ipsum dolor,sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepe quod autem iure repudiandae assumenda dolore eos blanditiis officiis tempora, corporis sit cum  placeat eveniet!",
        'boldTextList': ['elit', 'accusamus perferendis']
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: spaceLeftBigTitle,
          ),
          CustomUnderlineTitle(
            title: 'Nos Sites',
          )
        ]),
        const SizedBox(height: 30),
        Wrap(
          spacing: 40,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            for (var item in ourSites)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: _getSingleSiteView(
                  mediaScreenWidth: mediaScreenWidth,
                  place: item['place'],
                  imagePath: item['image'],
                ),
              ),
          ],
        )
      ],
    );
  }

  _getSingleSiteView({
    mediaScreenWidth,
    place,
    imagePath,
  }) {
    const double height = 400;
    const double width = 400;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.purple.withOpacity(0.7),
            width: width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Text(
              place,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

//-----OUR VALUES

  _getOurValues() {
    List<Map<String, String>> ourPrinciples = [
      {
        'svgName': 'assets/values_icons/medal.svg',
        'title': "L'Excellence",
        "text":
            "Nous visons toujours la perfection dans la qualité de nos services et solutions informatiques, dépassant les attentes de nos clients à chaque occasion.",
      },
      {
        'svgName': 'assets/values_icons/heart.svg',
        'title': "L'intégrité",
        "text":
            "Nous agissons avec honnêteté, éthique et transparence dans toutes nos interactions, garantissant ainsi des relations professionnelles solides et fiables.",
      },
      {
        'svgName': 'assets/values_icons/trust-wallet-svgrepo-com.svg',
        'title': "Confiance",
        "text":
            "Nous méritons et maintenons la confiance de nos clients et partenaires en respectant nos engagements et en livrant des résultats de qualité.",
      },
      {
        'svgName':
            'assets/values_icons/rocket-innovation-space-svgrepo-com.svg',
        'title': "L'innovation",
        "text":
            "Nous sommes des innovateurs passionnés, investissant dans la recherche et le développement pour créer des solutions informatiques avant-gardistes qui répondent aux besoins évolutifs de nos clients.",
      },
      {
        'svgName': 'assets/values_icons/burning-passion-svgrepo-com.svg',
        'title': "Passion",
        "text":
            "Notre passion pour notre travail se reflète dans notre engagement à fournir un service de qualité, à relever les défis avec enthousiasme et à maintenir une culture d'entreprise dynamique.",
      },
      {
        'svgName': 'assets/values_icons/services-svgrepo-com.svg',
        'title': "Service Client",
        "text":
            "Placer nos clients au centre de nos préoccupations en offrant un service client exceptionnel, basé sur une écoute attentive et des solutions personnalisées.",
      },
    ];

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomUnderlineTitle(
          title: 'Nos Valeurs',
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 20,
            spacing: 50,
            children: [
              for (var item in ourPrinciples)
                _getSingleValueBlock(
                    svgName: item['svgName'],
                    title: item['title'],
                    text: item['text'])
            ],
          ),
        )
      ],
    );
  }

  _getSingleValueBlock({svgName, title, text}) {
    return Container(
      width: 310,
      height: 375,
      decoration: BoxDecoration(
        // border: Border.all(width: 0.2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(partialCircularItem),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.4), // Couleur de l'ombre avec opacité
            spreadRadius: 5, // Rayon de diffusion de l'ombre
            blurRadius: 7, // Rayon de flou de l'ombre
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(completeCirvularItem),
              color: Colors.purple,
            ),
            child: SvgPicture.asset(
              svgName,
              height: 100,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

//------Our TEAM
  _getOurTeamWork(mediaScreenWidth) {
    return SizedBox(
        width: mediaScreenWidth,
        child: const Center(
          child: CustomTextBlock(
            image:
                'assets/about_us_image/group-people-holding-hand-assemble-togetherness.jpg',
            title: 'À Propos de Notre Équipe',
            text:
                "Notre équipe représente notre plus grand atout. Nous sommes fiers de rassembler une équipe jeune, dynamique et talentueuse, composée de professionnels passionnés par les nouvelles technologies. Elle bénéficie également d'une forte présence internationale, avec des développeurs basés en France, au Togo, au Cameroun et en Guinée.\nCette diversité géographique enrichit notre culture d'entreprise et nous permet de bénéficier d'un large éventail de compétences et de perspectives. La collaboration est au cœur de notre approche. Grâce à des outils de communication avancés, nous travaillons en étroite synergie, combinant les forces de chaque membre pour créer des solutions complètes et intégrées.\nNous investissons également dans la formation continue de notre équipe pour garantir qu'elle reste à la pointe des technologies et des pratiques de développement les plus avancées.",
            boldList: [
              'plus grand atout',
              "jeune, dynamique",
              "talentueuse",
              "compétences",
              "des solutions complètes et intégrées",
              "pratiques de développement les plus avancées."
            ],
          ),
        ));
  }

// OUR MAP POSITION

  _getLocalisation() {
    return const SizedBox();
  }

//--------
}

class BoxOfDetails extends StatelessWidget {
  const BoxOfDetails({super.key, required this.content, required this.onBack});
  final Map<String, dynamic> content;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double heightFactor = screenSize.height * 0.85;
    double widthFactor = screenSize.width * 0.35;

    if (screenSize.width > 800) {
      return _getBoxDetails(height: heightFactor, width: widthFactor);
    } else {
      return _getBoxDetails(height: 600, width: 450);
    }
    ;
  }

  Center _getBoxDetails({required double width, required double height}) {
    final List<Widget> textWidget = [
      Text(
        content['title'],
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 40)
    ];
    for (Map item in content['body']) {
      if (item['title'] != '') {
        textWidget.add(Text(item['title']));
        textWidget.add(const SizedBox(height: 30));
      }
      textWidget.add(Text(
        item['paragraph'],
        style: const TextStyle(fontSize: 19),
      ));
      textWidget.add(const SizedBox(height: 30));
    }
    return Center(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        onBack();
                      },
                      icon: const Icon(Icons.arrow_back),
                    )),
                ...textWidget
              ],
            ),
          )),
    );
  }
}
