import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import { data } from '../Editer_tamplet/Page';

const SchoolInfoDisplay = [
  {
    path: "/SchoolInfo/display/:id",
    title: "school info display",
    page: <DataDisplay
      pageName="school info display"
      url={"/api/school_info/?id="}
    />,
  }
];

const SchoolInfo = [
  [
    {
      path: "/SchoolInfo",
      pageName: "SchoolInfo",
      title: "SchoolInfo",

      page: <Page_
        pageName={"Pages"}
        url={"/api/school_info/"}
        deleteUrl={"/api/school_info/?id="}

      />,
    },
    {
      path: "/SchoolInfo/create",
      pageName: "SchoolInfo",
      url: "/api/school_info/",
      title: "eCommerce Dashboard | SchoolInfo Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"SchoolInfo"}
        url="/api/school_info/"

        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "date", name: "Date" },
          { type: "editer", name: "Content", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "text", name: "Author" },
          { type: "file", name: "Image" },
          { type: "date", name: "Created_At" }
        ]}
      />,
    },
    {
      path: "/SchoolInfo/update/:id",
      pageName: "SchoolInfo",
      url: "/api/school_info/?id=",
      title: "eCommerce Dashboard | SchoolInfo Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        pageName="SchoolInfo"
        url="/api/school_info/?id="
        getDataUrl="/api/school_info/?get-for-update="
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "editer", name: "Description", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "date", name: "Date" },
          { type: "editer", name: "Content", tamplet: [{ code: data, name: "page" }, { code: "<h2>helll</h2>", name: "page2" }] },
          { type: "text", name: "Author" },
          { type: "file", name: "Image" },
            { type: "text", name: "Image", disabled:true },
          { type: "date", name: "Created_At" }
        ]}
      />,
    },
    ...SchoolInfoDisplay
  ],
];

export { SchoolInfo };