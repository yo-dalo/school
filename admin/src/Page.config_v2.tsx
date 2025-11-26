import MultiInput from './components/InputsX/MultiInput';
import Update from './pages/Update';
import Page_ from './pages/Page';
import Create from './pages/Create';
import DataDisplay from './pages/DataDisplay';
//import {User} from './PageConfig/User.conf';
//import {Achievement} from './PageConfig/Achievement.conf';
// import {Award} from './PageConfig/Award.conf';
// import {BannerSlide} from './PageConfig/BannerSlide.conf';
//import {Blog} from './PageConfig/Blog.conf';
// import {BlogPost} from './PageConfig/BlogPost.conf';
// import {Facility} from './PageConfig/Facility.conf';
// import {News} from './PageConfig/News.conf';
// import {Pagev} from './PageConfig/Page.conf';
// import {PageCategory} from './PageConfig/PageCategory.conf.jsx';
// import {Result} from './PageConfig/Result.conf';
// import {SchoolInfo} from './PageConfig/SchoolInfo.conf';
// import {Student} from './PageConfig/Student.conf';
// import {Teacher} from './PageConfig/Teacher.conf';

import {Achievement} from './routerConfig/Achievement';
import {AdmissionOpenMessage} from './routerConfig/AdmissionOpenMessage';
import {Blog} from './routerConfig/Blog';
import {Addmission} from './routerConfig/Addmission';

import {Facility} from './routerConfig/Facility';
import {Gallery} from './routerConfig/Gallery';
import {GalleryCategory} from './routerConfig/GalleryCategory';
import {Messages} from './routerConfig/Messages';
import {Notification} from './routerConfig/Notification';
import {Pages} from './routerConfig/Pages';
import {PagesCategory} from './routerConfig/PagesCategory';
import {Poster} from './routerConfig/Poster';
import {QuickLink} from './routerConfig/QuickLink';
import {Result10th} from './routerConfig/Result10th';
import {Result12th} from './routerConfig/Result12th';
import {SchoolInfo} from './routerConfig/SchoolInfo';
import {UsefulLink} from './routerConfig/UsefulLink';






const Page = [
//  ...User,
// ...Achievement,
// ...Award,
//  ...BannerSlide,
//  ...Blog,
// ...BlogPost,
// ...Facility,
//  ...News,
// 
//  ...PageCategory,
//   ...Result,
//  ...SchoolInfo,
//  ...Student,
// ...Teacher,

//...Pagev,

 ...Achievement, 
 ...Blog, 
 ...Addmission,
 ...AdmissionOpenMessage, 
 ...Facility, 
 ...Gallery, 
 ...GalleryCategory, 
 ...Messages, 
 ...Notification, 
 ...Pages, 
 ...PagesCategory, 
 ...Poster, 
...QuickLink, 
 ...Result10th, 
...Result12th, 
...SchoolInfo, 
 ...UsefulLink, 
];

export { Page }
