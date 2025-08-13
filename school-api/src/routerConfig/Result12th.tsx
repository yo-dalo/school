import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const Result12thDisplay = [
  {
    path: "/Result_12th/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/result_12th/"}
      title={"eCommerce Dashboard | Result 12th display"}
    />,
  }
];

const Result12th = [
  [
    {
      path: "/Result_12th",
      pageName: "Result_12th",
      title: "Result_12th",
      page: <Page_
        pageName={"Result_12th"}
        url={"/api/result_12th/"}
        deleteUrl="/api/result_12th/?id="
        title={"eCommerce Dashboard | Result 12th"}
      />,
    },
    {
      path: "/Result_12th/create",
      pageName: "Result_12th",
      url: "/api/result_12th/",
      title: "eCommerce Dashboard | Result 12th Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Result_12th"}
        url="/api/result_12th/"
        deleteUrl=""
        inputs={[
          { type: "text", name: "Student_Name" },
          { type: "number", name: "Index_No" },
          { type: "file", name: "Image" },
          { type: "text", name: "Marks_Percentage" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"}, {code:"<h2>helll</h2>",name:"page2"}] },
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
      path: "/Result_12th/update/:id",
      pageName: "Result_12th",
      url: "/api/result_12th/?id=",
      title: "eCommerce Dashboard | Result 12th Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Result_12th"
        url="/api/result_12th/?id="
        getDataUrl="/api/result_12th/₹₹"
        inputs={[
          { type: "text", name: "Student_Name" },
          { type: "number", name: "Index_No" },
          { type: "file", name: "Image" },
          { type: "text", name: "Marks_Percentage" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"}, {code:"<h2>helll</h2>",name:"page2"}] },
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
    ...Result12thDisplay
  ],
];

export { Result12th };