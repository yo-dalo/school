import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const FacilityDisplay = [
  {
    path: "/Facility/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/facility/?get-for-update="}
      title={"eCommerce Dashboard | Facility display"}
    />,
  }
];

const Facility = [
  [
    {
      path: "/Facility",
      pageName: "Facility",
      title:"Facility",
      page: <Page_
        pageName={"Facility"}
        url={"/api/facility/"}
       deleteUrl="/api/facility/?id="
        title={"eCommerce Dashboard | Facility"}
      />,
    },
    {
      path: "/Facility/create",
      pageName: "Facility",
      title: "eCommerce Dashboard | Facility Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Facility"}
        url="/api/facility/"
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "file", name: "Image" },
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
      path: "/Facility/update/:id",
      pageName: "Facility",
      url: "/api/facility_api.php?id=",
      title: "eCommerce Dashboard | Facility Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Facility"
        url="/api/facility/?id="
        getDataUrl="/api/facility/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "file", name: "Image" },
          { type: "text", name: "Image" , disabled: true},
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
    ...FacilityDisplay
  ],
];

export { Facility };