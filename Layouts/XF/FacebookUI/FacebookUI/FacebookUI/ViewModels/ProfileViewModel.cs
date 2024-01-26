﻿using FacebookUI.Models;
using System.Collections.ObjectModel;

namespace FacebookUI.ViewModels
{
    public class ProfileViewModel
    {
        public ObservableCollection<Friends> friends { get; set; }
        public ObservableCollection<PrincipalComents> principalComents { get; set; }
        public ObservableCollection<PersonalInformation> personalInformation { get; set; }
        public ObservableCollection<PhotoRoll> photoRoll { get; set; }
        public ProfileViewModel()
        {

            photoRoll = new ObservableCollection<PhotoRoll>
            {
                new PhotoRoll {  Picture = "ProfileImage.jpg"   },
                new PhotoRoll {  Picture = "SunflowersTL.jpg"   },
                new PhotoRoll {  Picture = "TimeLineImage.jpg"  },
                new PhotoRoll {  Picture = "Girasol.jpg"        },
                new PhotoRoll {  Picture = "Agriculture.jpg"    },
                new PhotoRoll {  Picture = "Water.jpg"          },
            };


            personalInformation = new ObservableCollection<PersonalInformation>
            {
                new PersonalInformation
                {
                    Picture = "HomeIcon.png",
                    Description = "Mora em Viçosa"
                },
                new PersonalInformation
                {
                    Picture = "FromIcon.png",
                    Description = "De São Paulo"
                },
                new PersonalInformation
                {
                    Picture = "CivilStatusIcon.png",
                    Description = "Casado"
                },
                 new PersonalInformation
                {
                    Picture = "LinkIcon.png",
                    Description = "marcosdev.com"
                }
            };

            friends = new ObservableCollection<Friends>
            {
                new Friends
                {
                    Picture = "Friend1.jpg",
                    Name = "Vanessa Weiss"
                },
                new Friends
                {
                    Picture = "Friend2.jpg",
                    Name = "Paola Willys"
                },
                new Friends
                {
                    Picture = "Friend3.jpg",
                    Name = "Katty Prince"
                },
                new Friends
                {
                    Picture = "Friend4.jpg",
                    Name = "Amanda Scott"
                },
                new Friends
                {
                    Picture = "Friend5.jpg",
                    Name = "Keily Red"
                },
                new Friends
                {
                    Picture = "Friend6.jpg",
                    Name = "Josefa Perez"
                }
            };

            principalComents = new ObservableCollection<PrincipalComents>
            {
                 new PrincipalComents
                {
                    UserIcon = "ProfileImage",
                    PictureComment = "SunflowersTL.jpg",
                    Name="Marcos Aurelio",
                    Date="20 Junio 2019",
                    Comment="Hello people!!!",
                    Funny=true,
                    Like=true,
                    Love=false,
                    TotalComents="50 comments"
                },
                  new PrincipalComents
                {
                    UserIcon = "ProfileImage",
                    PictureComment = "Girasol.jpg",
                    Name="LMarcos Aurelio",
                    Date="8 Junio 2019",
                    Comment="Vai um comentário aqui!!!",
                    Funny=true,
                    Like=false,
                    Love=true,
                    TotalComents="10 comments"
                },
                  new PrincipalComents
                {
                    UserIcon = "ProfileImage",
                    PictureComment = "Agriculture.jpg",
                    Name="Marcos Aurelio",
                    Date="8 Junio 2019",
                    Comment="Vai outro comentário aqui!!!",
                    Funny=true,
                    Like=false,
                    Love=true,
                    TotalComents="10 comments"
                },
                  new PrincipalComents
                {
                    UserIcon = "ProfileImage",
                    PictureComment = "Water.jpg",
                    Name="Vai um comentário aqui!!!",
                    Date="8 Junio 2019",
                    Comment="E mais um comentário aqui!!!",
                    Funny=true,
                    Like=false,
                    Love=true,
                    TotalComents="10 comments"
                }
            };

        }
    }
}
