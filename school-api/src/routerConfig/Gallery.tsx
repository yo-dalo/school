import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const GalleryDisplay = [
  {
    path: "/Gallery/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/gallery/##"}
      title={"eCommerce Dashboard | Gallery display"}
    />,
  }
];

const Gallery = [
  [
    {
      path: "/Gallery",
      pageName: "Gallery",
      title:"Gallery",
      page: <Page_
        pageName={"Gallery"}
        url={"/api/gallery/?id="}
        deleteUrl="/api/gallery/?id="
        title={"eCommerce Dashboard | Gallery"}
        
      />,
    },
    {
      path: "/Gallery/create",
      pageName: "Gallery",
      url: "/api/gallery/",
      title: "eCommerce Dashboard | Gallery Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Gallery"}
        url="/api/gallery/"
        
        inputs={[
          { type: "number", name: "Gallery_Category_Id" }, // For category selection, use option if you want a dropdown
          { type: "file", name: "Image" },
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
      path: "/Gallery/update/:id",
      pageName: "Gallery",
      url: "/api/gallery/?id=",
      title: "eCommerce Dashboard | Gallery Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Gallery"
        url="/api/gallery/?id="
        getDataUrl="/api/gallery/?get-for-update="
        inputs={[
          { type: "number", name: "Gallery_Category_Id" },
          { type: "file", name: "Image" },
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
    ...GalleryDisplay
  ],
];

export { Gallery };