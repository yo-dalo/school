
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
  page: JSX.Element;
}

// Display Route
const AchievementDisplay: RouteItem[] = [
  {
    path: "/Achievements/display/:id",
    title: "Achievement Details",
    page: (
      <DataDisplay
        pageName="Achievement Details"
        url={"/api/achievements/?id="}
      />
    ),
  },
];

// Main Routes
const Achievement: RouteItem[][] = [
  [
    {
      path: "/Achievements",
      pageName: "Achievements",
      title: "Achievements",
      page: (
        <Page_
          pageName={"Achievements"}
          url={"/api/achievements/"}
          deleteUrl={"/api/achievements/"}
        />
      ),
    },
    {
      path: "/Achievements/create",
      pageName: "Achievements",
      title: "Create Achievements",
      page: (
        <Create
          pageName={"Achievements"}
          url={"/api/achievements/"}
          inputs={
            [
              { type: "file", name: "Image" },
              { type: "text", name: "Name" },
              { type: "text", name: "Title" },
              {
                type: "editer",
                name: "Description",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              { type: "number", name: "Index_No" },
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
            ] as InputField[]
          }
        />
      ),
    },
    {
      path: "/Achievements/update/:id",
      pageName: "Achievements",
      title: "Update Achievements",
      page: (
        <Update
          pageName="Achievements"
          url={"/api/achievements/?id="}
          getDataUrl="/api/achievements/?get-for-update="
          inputs={
            [
              { type: "file", name: "Image" },
              { type: "text", name: "Image", disabled: true },
              { type: "text", name: "Name" },
              { type: "text", name: "Title" },
              {
                type: "editer",
                name: "Description",
                tamplet: [
                  { code: data, name: "page" },
                  { code: "<h2>helll</h2>", name: "page2" },
                ],
              },
              { type: "number", name: "Index_No" },
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
            ] as InputField[]
          }
        />
      ),
    },
    ...AchievementDisplay,
  ],
];

export { Achievement };
