import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const MessagesDisplay = [
  {
    path: "/Messages/display/:id",
    title: "messages display",
    page: <DataDisplay
      pageName="messages display"
      url={"/api/messages/?id="}
    />,
  }
];

const Messages = [
  [
    {
      path: "/Messages",
      pageName: "Messages",
      title: "Messages",
      page: <Page_
        pageName={"Messages"}
        url={"/api/messages/"}
        deleteUrl={"/api/messages/?id="}
      />,
    },
    {
      path: "/Messages/create",
      pageName: "Messages",
      url: "/api/messages/",
      title: "eCommerce Dashboard | Messages Create",
      page: <Create
        pageName={"Messages"}
        url="/api/messages/"
      
        inputs={[
          { type: "file", name: "Image" },
          { type: "text", name: "Name" },
          { type: "text", name: "Roll" },
          { type: "editer", name: "Description", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "text", name: "Read_More_Url" },
          { type: "number", name: "Index_No" },
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
      path: "/Messages/update/:id",
      pageName: "Messages",
      url: "/api/messages/?id=",
      title: "eCommerce Dashboard | Messages Update",
      page: <Update
        pageName="Messages"
        url="/api/messages/?id="
        getDataUrl="/api/messages/?get-for-update="
        inputs={[
          { type: "file", name: "Image" },
            { type: "text", name: "Image", disabled:true },
          { type: "text", name: "Name" },
          { type: "text", name: "Roll" },
          { type: "editer", name: "Description", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "text", name: "Read_More_Url" },
          { type: "number", name: "Index_No" },
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
    ...MessagesDisplay
  ],
];

export { Messages };