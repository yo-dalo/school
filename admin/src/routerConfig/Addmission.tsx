import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const AddmissionDisplay = [
  {
    path: "/Addmission/display/:id",
    title: "Addmission display",
    page: <DataDisplay
      pageName="Addmission display"
      url={"/api/Addmission/?id="}
    />,
  }
];

const Addmission = [
  [
    {
      path: "/Addmission",
      pageName: "Addmission",
      title:"Addmission",
      page: <Page_
        pageName={"Addmission"}
        url={"/api/Addmission/"}
        deleteUrl={"/api/Addmission/?id="}
      
      />,
    },
    {
      path: "/Addmission/create",
      pageName: "Addmission",
      url: "/api/Addmission/",
      title: "eCommerce Dashboard | Addmission Create",
      page: <Create
        pageName={"Addmission"}
        url="/api/Addmission/"
    
        inputs={
            [
              { type: "text", name: "Name" },
              { type: "text", name: "Father_Name" },
              { type: "text", name: "Mother_Name" },
              { type: "text", name: "Email" },
              { type: "number", name: "Phone" },
              { type: "text", name: "Class" },
              { type: "date", name: "DOB" },
              { type: "text", name: "City" },
              { type: "text", name: "State" },
              {
                type: "option",
                name: "Gender",
                options: [
                  { value: "Male", label: "Male" },
                  { value: "Female", label: "Female" },
                  { value: "Other", label: "Other" },
                ],
              },
              { type: "date", name: "Admission_Date" },
              {
                type: "editer",
                name: "More_Info",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              {
                type: "option",
                name: "Is_Active",
                options: [
                  { value: "active", label: "Active" },
                  { value: "inactive", label: "Inactive" },
                ],
              },
              { type: "date", name: "Created_At" },
              { type: "date", name: "Updated_At" },
            ]
          }
      />,
    },
    {
      path: "/Addmission/update/:id",
      pageName: "Addmission",
      url: "/api/Addmission/?id=",
      title: "eCommerce Dashboard | Addmission Update",
      page: <Update
        pageName="Addmission"
        url="/api/Addmission/?id="
        getDataUrl="/api/Addmission/?get-for-update="
       inputs={
            [
              { type: "text", name: "Name" },
              { type: "text", name: "Father_Name" },
              { type: "text", name: "Mother_Name" },
              { type: "text", name: "Email" },
              { type: "number", name: "Phone" },
              { type: "text", name: "Class" },
              { type: "date", name: "DOB" },
              { type: "text", name: "City" },
              { type: "text", name: "State" },
              {
                type: "option",
                name: "Gender",
                options: [
                  { value: "Male", label: "Male" },
                  { value: "Female", label: "Female" },
                  { value: "Other", label: "Other" },
                ],
              },
              { type: "date", name: "Admission_Date" },
              {
                type: "editer",
                name: "More_Info",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              {
                type: "option",
                name: "Is_Active",
                options: [
                  { value: "active", label: "Active" },
                  { value: "inactive", label: "Inactive" },
                ],
              },
              { type: "date", name: "Created_At" },
              { type: "date", name: "Updated_At" },
            ]
          }
      />,
    },
    ...AddmissionDisplay
  ],
];

export { Addmission };