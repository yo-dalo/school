import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const Result10thDisplay = [
  {
    path: "/Result_10th/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/result_10th/?id="}
      title={"eCommerce Dashboard | Result 10th display"}
    />,
  }
];

const Result10th = [
  [
    {
      path: "/Result_10th",
      pageName: "Result_10th",
      title: "Result_10th",
      page: <Page_
        pageName={"Result_10th"}
        url={"/api/result_10th/"}
        deleteUrl={"/api/result_10th/?id="}
        title={"eCommerce Dashboard | Result 10th"}
      />,
    },
    {
      path: "/Result_10th/create",
      pageName: "Result_10th",
      url: "/api/result_10th/",
      title: "eCommerce Dashboard | Result 10th Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Result_10th"}
        url="/api/result_10th/"
        
        inputs={[
          { type: "text", name: "Student_Name" },
          { type: "number", name: "Index_No" },
          { type: "file", name: "Image" },
          { type: "text", name: "Marks_Percentage" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
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
      path: "/Result_10th/update/:id",
      pageName: "Result_10th",
      url: "/api/result_10th/?id=",
      title: "eCommerce Dashboard | Result 10th Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Result_10th"
        url="/api/result_10th/?id="
        getDataUrl="/api/result_10th/?get-for-update="
        inputs={[
          { type: "text", name: "Student_Name" },
          { type: "number", name: "Index_No" },
          { type: "file", name: "Image" },
          { type: "text", name: "Marks_Percentage" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
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
    ...Result10thDisplay
  ],
];

export { Result10th };