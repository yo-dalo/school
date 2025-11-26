import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';

const PosterDisplay = [
  {
    path: "/Poster/display/:id",
    title: "poster display",
    page: <DataDisplay
      pageName="poster display"
      url={"/api/poster/?id="}
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
      />,
    },
    {
      path: "/Poster/create",
      pageName: "Poster",
      url: "/api/poster/",
      title: "eCommerce Dashboard | Poster Create",
      page: <Create
        pageName={"Poster"}
        url="/api/poster/"
      
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "file", name: "Image" },
          { type: "text", name: "Name" },
         { type: "option", name: "Is_Active", optionBy:"value", valueBy:"label"  , options: [
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
      page: <Update
        pageName="Poster"
        url="/api/poster/?id="
        getDataUrl="/api/poster/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Url" },
          { type: "file", name: "Image" },
            { type: "text", name: "Image" ,disabled:true },
          { type: "text", name: "Name" },
        { type: "option", name: "Is_Active", optionBy:"value", valueBy:"label"  , options: [
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