import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const PosterDisplay = [
  {
    path: "/Poster/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/poster/?id="}
      title={"eCommerce Dashboard | Poster display"}
    />,
  }
];

const Poster = [
  [
    {
      path: "/Poster",
      pageName: "Poster",
      title: "Poster",
      page: <Page_
        pageName={"Poster"}
        url={"/api/poster/"}
        deleteUrl={"/api/poster/?id="}
        title={"eCommerce Dashboard | Poster"}
      />,
    },
    {
      path: "/Poster/create",
      pageName: "Poster",
      url: "/api/poster/",
      title: "eCommerce Dashboard | Poster Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Poster"}
        url="/api/poster/"
      
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "file", name: "Image" },
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
      path: "/Poster/update/:id",
      pageName: "Poster",
      url: "/api/poster/?id=",
      title: "eCommerce Dashboard | Poster Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Poster"
        url="/api/poster/?id="
        getDataUrl="/api/poster/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "file", name: "Image" },
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
    ...PosterDisplay
  ],
];

export { Poster };