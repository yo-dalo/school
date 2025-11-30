import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';

const QuickLinkDisplay = [
  {
    path: "/Quick_Link/display/:id",
    title: "Quick Link display",
    page: <DataDisplay
      pageName="Quick Link display"
      url={"/api/quick_link/?id="}
    />,
  }
];

const QuickLink = [
  [
    {
      path: "/Quick_Link",
      pageName: "Quick_Link",
      title: "Quick_Link",
      page: <Page_
        pageName={"Quick_Link"}
        url={"/api/quick_link/"}
        deleteUrl={"/api/quick_link/?id="}
      />,
    },
    {
      path: "/Quick_Link/create",
      pageName: "Quick_Link",
      url: "/api/quick_link/",
      title: "eCommerce Dashboard | Quick Link Create",
      page: <Create
        pageName={"Quick_Link"}
        url="/api/quick_link/"
        
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
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
      path: "/Quick_Link/update/:id",
      pageName: "Quick_Link",
      url: "/api/quick_link/?id=",
      title: "eCommerce Dashboard | Quick Link Update",
      page: <Update
        pageName="Quick_Link"
        url="/api/quick_link/?id="
        getDataUrl="/api/quick_link/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
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
    ...QuickLinkDisplay
  ],
];

export { QuickLink };