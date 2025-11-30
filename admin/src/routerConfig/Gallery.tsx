import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';
import type { BlogDisplayRoute, BlogRoutes } from '../types/Blog.types';

const GalleryDisplay: BlogDisplayRoute[] = [
  {
    path: "/Gallery/display/:id",
    title: "gallery display",
    page: <DataDisplay
      pageName="gallery display"
      url={"/api/gallery/##"}
    />,
  }
];

const Gallery: BlogRoutes = [
  [
    {
      path: "/Gallery",
      pageName: "Gallery",
      title:"Gallery",
      page: <Page_
        pageName={"Gallery"}
        url={"/api/gallery/?id="}
        deleteUrl="/api/gallery/?id="

        
      />,
    },
    {
      path: "/Gallery/create",
      pageName: "Gallery",
      url: "/api/gallery/",
      title: "eCommerce Dashboard | Gallery Create",
      page: <Create
        pageName={"Gallery"}
        url="/api/gallery/"
        
        inputs={[
          { type: "number", name: "Gallery_Category_Id" }, // For category selection, use option if you want a dropdown
          { type: "file", name: "Image" },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "option", name: "Is_Active", optionBy: "value", valueBy: "label", options: [
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
      page: <Update
        pageName="Gallery"
        url="/api/gallery/?id="
        getDataUrl="/api/gallery/?get-for-update="
        inputs={[
          { type: "number", name: "Gallery_Category_Id" },
          { type: "file", name: "Image" },
            { type: "text", name: "Image", disabled:true },
          { type: "editer", name: "Description", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "option", name: "Is_Active", optionBy: "value", valueBy: "label", options: [
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