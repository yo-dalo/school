import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const UsefulLinkDisplay = [
  {
    path: "/Useful_Link/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/useful_link/"}
      title={"eCommerce Dashboard | Useful Link display"}
    />,
  }
];

const UsefulLink = [
  [
    {
      path: "/Useful_Link",
      pageName: "Useful_Link",
      title: "Useful_Link",
      page: <Page_
        pageName={"Useful_Link"}
        url={"/api/useful_link/"}
        deleteUrl={"/api/useful_link/?id="}
        title={"eCommerce Dashboard | Useful Link"}
      />,
    },
    {
      path: "/Useful_Link/create",
      pageName: "Useful_Link",
      url: "/api/useful_link/",
      title: "eCommerce Dashboard | Useful Link Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Useful_Link"}
        url="/api/useful_link/"
      
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "text", name: "Name" },
          { type: "option", name: "Is_Active", options: [
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
      path: "/Useful_Link/update/:id",
      pageName: "Useful_Link",
      url: "/api/useful_link/?id=",
      title: "eCommerce Dashboard | Useful Link Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Useful_Link"
        url="/api/useful_link/?id="
        getDataUrl="/api/useful_link/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "text", name: "Name" },
          { type: "option", name: "Is_Active", options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    ...UsefulLinkDisplay
  ],
];

export { UsefulLink };