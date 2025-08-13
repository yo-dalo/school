import MultiInput from '../components/InputsX/MultiInput';
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const GalleryCategoryDisplay = [
  {
    path: "/Gallery_Category/display/:id",
    pageName: "_",
    page: <DataDisplay
      pageName=""
      url={"/api/gallery_category/##"}
      title={"eCommerce Dashboard | Gallery Category display"}
    />,
  }
];

const GalleryCategory = [
  [
    {
      path: "/Gallery_Category",
      pageName: "Gallery_Category",
      title:"Gallery_Category",
      page: <Page_
        pageName={"Gallery_Category"}
        url={"/api/gallery_category/"}
        deleteUrl={"/api/gallery_category/?id="}
        title={"eCommerce Dashboard | Gallery Category"}
      />,
    },
    {
      path: "/Gallery_Category/create",
      pageName: "Gallery_Category",
      url: "/api/gallery_category/",
      title: "eCommerce Dashboard | Gallery Category Create",
      felds: [{ inputTypy: "text" }],
      page: <Create
        pageName={"Gallery_Category"}
        url="/api/gallery_category/"
        
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "date", name: "Date" },
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
      path: "/Gallery_Category/update/:id",
      pageName: "Gallery_Category",
      url: "/api/gallery_category/?id=",
      title: "eCommerce Dashboard | Gallery Category Update",
      felds: [{ inputTypy: "text" }],
      page: <Update
        name="Gallery_Category"
        url="/api/gallery_category/?id="
        getDataUrl="/api/gallery_category/?get-for-update="
        inputs={[
          { type: "text", name: "Name" },
          { type: "text", name: "Title" },
          { type: "number", name: "Index_No" },
          { type: "date", name: "Date" },
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
    ...GalleryCategoryDisplay
  ],
];

export { GalleryCategory };