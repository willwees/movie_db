import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/app_colors.dart';
import 'package:moviedb/src/constants/asset_names.dart';
import 'package:moviedb/src/constants/device_properties.dart';
import 'package:moviedb/src/constants/text/profile_text.dart';
import 'package:moviedb/src/shared/widgets/card_review_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProfileText.profile),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeaderSection(),
              _buildReviewListSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: kDeviceLogicalWidth,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: AssetImage(GeneralAssetNames.movieDbLogoPng),
            backgroundColor: AppColors.kLightBlue,
            radius: 50.0,
          ),
          const SizedBox(width: 32.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'William Suyanto',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Movie Reviewer',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8.0),
              Text(
                '3 reviews',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static const List<Map<String, dynamic>> _mockupList = <Map<String, dynamic>>[
    <String, dynamic>{
      'movie': 'Morbius',
      'content': 'Nothing in this movie makes any sense. If he has to drink a bag of blood every 6 hours, why not just do so? The human populace of how many billion people can not sustain a single vampire? No, he makes and consumes artificial blood for ethical reasons. Who says he needs to kill or hurt people to get what he needs? Horrible premise for his actions, not believable at all. And the rest of the story is the same. Weird decision making, boring, pointless dialogue. The bad guy is suddenly bad lacking any morals because he was bullied once apparently. Vampire powers are a myriad of random things. One time he is able to fly and it is hard to determine why exactly, the movie suggests because a subway train is pushing the air in front of it. Not only is it nonsense, it also looks bad CGI wise. To end on a good note, Jared Leto is a great actor and I would love to finally see him in a good movie.',
      'rating': 1.0,
    },
    <String, dynamic>{
      'movie': 'The Northman',
      'content': 'I was expecting more from this movie, but it turned out to be a big disappointment.\r\n\r\n'
          "First of all Vikings in this movie were represented more like an animals, acting like a rabid animals rather than humans and Vikings we have seen in popular TV shows, but the reason why I'm giving such a low score to this movie is simple - boredom. \r\n\r\n"
          "Character development was poor. I didn't care for any of them. Story was a typical vengeance story, nothing special or unique and the movie itself was very slow, lacking action and I almost fell a sleep. At first it seemed a realistic movie, but then they started putting supernatural things, so it wasn't realistic, but wasn't a typical unrealistic movie (like Marvel and DC) either. It was just a poor attempt of mixed jumble. It's sad to see such a great actors wasted in this boring movie, but even they couldn't save it if script was so poorly written and executed.",
      'rating': 3.0,
    },
    <String, dynamic>{
      'movie': 'The Batman',
      'content': '“The Batman” Is A Very Engaging And Unforgettable Tale That Is One Of The Best Adaptations Of The Character Ever\r\n\r\n'
          'In 1989 Michael Keaton was seen as a very controversial choice to wear the Cowl of Batman but soon proved his doubters wrong by turning “Batman” and its subsequent sequel “Batman Returns” into massive Box Office success before leaving the cape behind.\r\n\r\n'
          'While four other actors have taken up the cinematic version of the character in the subsequent years, Keaton has remained for many the Gold Standard with Christian Bale likely being his biggest rival.\r\n\r\n'
          'When Robert Pattinson was named as the new Batman, there was interest but concern as an actor who is largely known for playing Edward in the “Twilight” films seemed to be an odd choice. However, I would say that anyone who has seen some of his recent work including his performance in “The Lighthouse” would be playing him a disservice by saying he was not up to the part.\r\n\r\n'
          'In “The Batman”, audiences are given a darker and more broken Bruce Wayne, an Emo recluse who is far from the Socialite he has been portrayed as for decades and a very sullen and withdrawn individual who does not exude charm or grace and even shows issues making eye-contact.\r\n\r\n'
          'When the Mayor of Gotham is killed shortly before the election by a mysterious individual known as “The Riddler” (Paul Dano), the vigilante known as “The Batman” is called in to help the police by Lt. James Gordon (Jeffrey Wright).  Gordon has been working with Batman for some time but it is clear that his association with him has not won him any favors with his fellow officers, many of which openly question his use and involvement in the crime scenes.\r\n\r\n'
          'Further complicating matters are clues left at the various crime locales that are addressed to The Batman and cause many to believe that he may be working with the very killer they are attempting to stop.\r\n\r\n'
          'As the investigation unfolds, the seedy side of Gotham City comes to light in the form of a missing girl who was photographed with the married Mayor and may well be the key to the investigation. Her disappearance leads her friend Selina Kyle (Zoe Kravitz), to take on her Catwoman persona and delve deep into an underworld that features deadly individuals ranging from Carmine Falcone (John Turturro), and The Penguin (Colin Farrell), amongst others as she and the Batman conduct their own investigations that at times overlap and further complicate matters.\r\n\r\n'
          'As the body count rises and Batman races to find the true method behind the madness of The Riddler, the tone becomes darker and more sinister in a deadly race against time.\r\n\r\nThe film eschews the usual abundance of action sequences and glossy special effects which are common for Comic Book related films and instead gives audiences a slow-burning murder mystery that holds your attention from start to finish over its three-hour run time.\r\n\r\n'
          'The dark and foreboding tone of the film is brought home by the haunting and sharp piano keys of the film’s theme that permeates the film and punches home that this is a film clearly aimed at a more adult audience.\r\n\r\n'
          'Pattinson does a great job showing the deeply broken individual that is behind the mask and that Batman is the only form of escape or therapy that Bruce Wayne has due to his insistence on saving a city that many argue cannot be saved. He has strained his relationship at times with Alfred (Andy Serkis), caused damage to the financial stability and reputation of the family company in his quest for vengeance and justice, and has become a bitter and broken recluse in doing so. In many ways, it could be argued that his only socialization with others is as The Batman and his single-minded obsession is chilling to watch.\r\n\r\n'
          'Pattinson also handles the action sequences well as the film spaces them out to put the emphasis more on the man than the gadgets as they are kept to a minimum even during a thrilling chase with the new version of The Batmobile.\r\n\r\n'
          'The strong supporting cast works well with the film and Paul Dano gives a very compelling and disturbing version of his character which makes the film even darker and more engrossing.\r\n\r\n'
          'Director Matt Reeves has crafted a dark and foreboding tone and visual style as a good portion of the film takes place in the darkness and his screenplay is not afraid to take chances by putting the emphasis on the characters and their flaws versus an abundance of action and effects.\r\n\r\n'
          'I found this version of the character and interpretation more engrossing than prior versions of the film as the bold move to do a slow-burning and dark murder mystery versus an effect-laden action film reminded me of some of the better Batman stories such as Batman: The Killing Joke or Batman: The Long Halloween.\r\n\r\n'
          'The film is not going to be for everyone, especially younger viewers and some may take issue with the casting choices, but their performances shine and as such, “The Batman” was a very engaging and unforgettable tale that for me serves as one of the best adaptations of the character ever.\r\n\r\n'
          '4 stars out of 5',
      'rating': 8.0,
    },
  ];

  Widget _buildReviewListSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'Reviews',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(height: 8.0),
        ..._mockupList
            .map(
              (e) => CardReviewWidget(
                username: e['movie'] as String,
                content: e['content'] as String,
                rating: e['rating'] as double,
              ),
            )
            .toList(),
      ],
    );
  }
}
