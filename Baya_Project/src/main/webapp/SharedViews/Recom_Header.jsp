
    .input_recom-wrap {

        position: relative;
        flex: 1;
        width: 415px;
        margin: 0 25px;

    }
    .search_recom {

        z-index: 1000;
        top: 140%;
        left: 0;
        width: 100%;
        height: fit-content;
        position: absolute;
        background-color: #246fdf;
        display: none;
    }

    .header_search:focus-within .search_recom {
        display: block;
    }

    .recom_item {
        padding: 15px 20px;
        display: flex;

        height: 20%;
        background-color: #fff;
        color: #0e2238;

    }
    .recom_item p{
        color: #0e2238 !important;
    }
    .header_search{
        width: 100%  !important;
        height: 100%  !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
    }

    .recom_item:hover {
        cursor: pointer;
        background-color: rgb(239, 239, 239);
        color: var(--main_bg);
    }
