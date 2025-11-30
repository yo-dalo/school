
import Update from "../pages/Update";
import Page_ from "../pages/Page";
import Create from "../pages/Create";
import DataDisplay from "../pages/DataDisplay";
import { data } from "../Editer_tamplet/Page";

// Input field type
interface InputField {
  type: string;
  name: string;
  disabled?: boolean;
  tamplet?: { code: string; name: string }[];
  optionBy?: string;
  valueBy?: string;
  options?: { value: string; label: string }[];
}

// Route type
interface RouteItem {
  path: string;
  pageName?: string;
  title: string;
  url?: string;
  page: JSX.Element;
}

// Display Route
const AdmissionOpenMessageDisplay: RouteItem[] = [
  {
    path: "/Admission_Open_Message/display/:id",
    title: "Admission Open Message Display",
    page: (
      <DataDisplay
        pageName="Admission Open Message Display"
        url={"/api/admission_open_message/?id="}
      />
    ),
  },
];

// Main Routes
const AdmissionOpenMessage: RouteItem[][] = [
  [
    {
      path: "/Admission_Open_Message",
      pageName: "Admission_Open_Message",
      title: "Admission_Open_Message",
      page: (
        <Page_
          pageName={"Admission_Open_Message"}
          url={"/api/admission_open_message/"}
          deleteUrl="/api/admission_open_message/?id=" // ✅ fixed (was facility)
        />
      ),
    },
    {
      path: "/Admission_Open_Message/create",
      pageName: "Admission_Open_Message",
      url: "/api/admission_open_message/",
      title: "eCommerce Dashboard | Admission Open Message Create",
      page: (
        <Create
          pageName={"Admission_Open_Message"}
          url="/api/admission_open_message/"
          inputs={
            [
              { type: "text", name: "Title" },
              { type: "number", name: "Index_No" },
              {
                type: "editer",
                name: "Message",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              { type: "file", name: "Image" },
              { type: "text", name: "Read_More_Url" },
              {
                type: "option",
                name: "Is_Active",
                optionBy: "value",
                valueBy: "label",
                options: [
                  { value: "active", label: "Active" },
                  { value: "inactive", label: "Inactive" },
                ],
              },
              { type: "date", name: "Created_At" },
              { type: "date", name: "Updated_At" },
            ] as InputField[]
          }
        />
      ),
    },
    {
      path: "/Admission_Open_Message/update/:id",
      pageName: "Admission_Open_Message",
      url: "/api/admission_open_message/",
      title: "eCommerce Dashboard | Admission Open Message Update",
      page: (
        <Update
          pageName="Admission_Open_Message"
          url="/api/admission_open_message/?id="
          getDataUrl="/api/admission_open_message/?get-for-update="
          inputs={
            [
              { type: "text", name: "Title" },
              { type: "number", name: "Index_No" },
              {
                type: "editer",
                name: "Message",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              { type: "file", name: "Image" },
              { type: "text", name: "Image", disabled: true },
              { type: "text", name: "Read_More_Url" },
              {
                type: "option",
                name: "Is_Active",
                optionBy: "value",
                valueBy: "label",
                options: [
                  { value: "active", label: "Active" },
                  { value: "inactive", label: "Inactive" },
                ],
              },
              { type: "date", name: "Created_At" },
              { type: "date", name: "Updated_At" },
            ] as InputField[]
          }
        />
      ),
    },
    ...AdmissionOpenMessageDisplay,
  ],
];

export { AdmissionOpenMessage };
