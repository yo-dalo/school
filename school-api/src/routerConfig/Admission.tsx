import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const AdmissionDisplay = [
  {
    path: "/Admission/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/addmission/?id="}
      title={"eCommerce Dashboard | Admission display"}
    />,
  }
];

const Admission = [
  [
    {
      path: "/Admission",
      pageName: "Admission",
      title:"Admission",
      page: <Page_
        pageName={"Admission"}
        url={"/api/addmission"}
        deleteUrl="/api/addmission/?id="
        title={"eCommerce Dashboard | Admission"}
      />,
    },
    {
      path: "/Admission/create",
      pageName: "Admission",
      url: "/api/addmission/",
      title: "eCommerce Dashboard | Admission Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Admission"}
        url="/api/addmission/"
        deleteUrl=""
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Father_Name" },
          { type: "text", name: "Mother_Name" },
          { type: "text", name: "Email" },
          { type: "number", name: "Phone" },
          { type: "text", name: "Class" },
          { type: "date", name: "DOB" },
          { type: "text", name: "City" },
          { type: "text", name: "State" },
          { type: "option", name: "Gender", options: [
              { value: "Male", label: "Male" },
              { value: "Female", label: "Female" },
              { value: "Other", label: "Other" }
            ]
          },
          { type: "date", name: "Admission_Date" },
          { type: "editer", name: "More_Info", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
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
      path: "/Admission/update/:id",
      pageName: "Admission",
      url: "/api/admission/",
      title: "eCommerce Dashboard | Admission Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Admission"
        url="/api/admission/"
        getDataUrl="/api/admission/?get-for-update="
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Father_Name" },
          { type: "text", name: "Mother_Name" },
          { type: "text", name: "Email" },
          { type: "number", name: "Phone" },
          { type: "text", name: "Class" },
          { type: "date", name: "DOB" },
          { type: "text", name: "City" },
          { type: "text", name: "State" },
          { type: "option", name: "Gender", options: [
              { value: "Male", label: "Male" },
              { value: "Female", label: "Female" },
              { value: "Other", label: "Other" }
            ]
          },
          { type: "date", name: "Admission_Date" },
          { type: "editer", name: "More_Info", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
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
    ...AdmissionDisplay
  ],
];

export { Admission };