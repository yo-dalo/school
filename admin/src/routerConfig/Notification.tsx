import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const NotificationDisplay = [
  {
    path: "/Notification/display/:id",
    title: "notification display",
    page: <DataDisplay
      pageName="notification display"
      url={"/api/notification/?id="}
    />,
  }
];

const Notification = [
  [
    {
      path: "/Notification",
      pageName: "Notification",
      title:"Notification",
      page: <Page_
        pageName={"Notification"}
        url={"/api/notification/"}
        deleteUrl={"/api/notification/?id="}
      />,
    },
    {
      path: "/Notification/create",
      pageName: "Notification",
      url: "/api/notification/",
      title: "eCommerce Dashboard | Notification Create",
      page: <Create
        pageName={"Notification"}
        url="/api/notification/"
        
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "option", name: "Is_Important", options: [
              { value: "1", label: "Important" },
              { value: "0", label: "Normal" }
            ]
          },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "date", name: "Date" },
          { type: "text", name: "Name" },
         { type: "option", name: "Is_Active", optionBy:"value", valueBy:"label"  , options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    {
      path: "/Notification/update/:id",
      pageName: "Notification",
      url: "/api/notification/?id=",
      title: "eCommerce Dashboard | Notification Update",
      page: <Update
        pageName="Notification"
        url="/api/notification/?id="
        getDataUrl="/api/notification/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "option", name: "Is_Important", options: [
              { value: "1", label: "Important" },
              { value: "0", label: "Normal" }
            ]
          },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "date", name: "Date" },
          { type: "text", name: "Name" },
         { type: "option", name: "Is_Active", optionBy:"value", valueBy:"label"  , options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    ...NotificationDisplay
  ],
];

export { Notification };