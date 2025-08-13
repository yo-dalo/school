import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

// Display Route
const AchievementDisplay = [
  {
    path: "/Achievements/display/:id", // Table name capitalized as per your instruction
    pageName: "_",
    page: <DataDisplay
      pageName="/api/achievements/?id="
      url={"/api/achievements/?id="} 
      title={"eCommerce Dashboard | create Achievements "} // Table name used
    />,
  }
];

// Main Routes
const Achievement = [
  [
    {
      path: "/Achievements", // Table name used
      pageName: "Achievements", // Table name used
      title:"Achievements", // Table name used
      page: <Page_
        pageName={"Achievements"} // Table name used
        url={"/api/achievements/"} // Table name used
        title={"eCommerce Dashboard | create Achievements "} // Table name used
      />,
    },
    {
      path: "/Achievements/create", // Table name used
      pageName: "Achievements", // Table name used
      title: "eCommerce Dashboard | create Achievements ",
      page: <Create
        pageName={"Achievements"} // Table name used
        url={"/api/achievements/"} 
        inputs={[
          { type: "file", name: "Image" }, // Image file input
          { type: "text", name: "Name" }, // Name
          { type: "text", name: "Title" }, // Title
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] }, // Description
          { type: "number", name: "Index_No" }, // Index_No
          { 
            type: "option", 
            name: "Is_Active", 
            options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          }, // Is_Active option
          { type: "date", name: "Created_At" }, // Created_At
          { type: "date", name: "Updated_At" }  // Updated_At
        ]}
      />,
    },
    {
      path: "/Achievements/update/:id", // Table name used
      pageName: "Achievements", // Table name used
      title: "eCommerce Dashboard | create Achievements ",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Achievements" // Table name used
        url={"/api/achievements/?id="} 
        getDataUrl="/api/achievements/?get-for-update=" // Table name used
        inputs={[
          { type: "file", name: "Image" },
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "number", name: "Index_No" },
          { 
            type: "option", 
            name: "Is_Active", 
            options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    ...AchievementDisplay
  ],
];

export { Achievement };