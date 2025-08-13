import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const AdmissionOpenMessageDisplay = [
  {
    path: "/Admission_Open_Message/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/admission_open_message/?id="}
      title={"eCommerce Dashboard | Admission Open Message display"}
    />,
  }
];

const AdmissionOpenMessage = [
  [
    {
      path: "/Admission_Open_Message",
      pageName: "Admission_Open_Message",
      title:"Admission_Open_Message",
      page: <Page_
        pageName={"Admission_Open_Message"}
        url={"/api/admission_open_message/"}
        deleteUrl="/api/facility/?id="
        title={"eCommerce Dashboard | Admission Open Message"}
      />,
    },
    {
      path: "/Admission_Open_Message/create",
      pageName: "Admission_Open_Message",
      url: "/api/admission_open_message/",
      title: "eCommerce Dashboard | Admission Open Message Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Admission_Open_Message"}
        url="/api/admission_open_message/"
        
        inputs={[
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "editer", name: "Message", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "file", name: "Image" },
          { type: "text", name: "Read_More_Url" },
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
      path: "/Admission_Open_Message/update/:id",
      pageName: "Admission_Open_Message",
      url: "/api/admission_open_message/",
      title: "eCommerce Dashboard | Admission Open Message Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Admission_Open_Message"
        url="/api/admission_open_message/?id="
        getDataUrl="/api/admission_open_message/?get-for-update="
        inputs={[
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "editer", name: "Message", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "file", name: "Image" },
          { type: "text", name: "Read_More_Url" },
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
    ...AdmissionOpenMessageDisplay
  ],
];

export { AdmissionOpenMessage };