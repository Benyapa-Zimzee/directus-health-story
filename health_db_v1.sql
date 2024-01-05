PGDMP  0                      |         	   health_db    16.0    16.0 �    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    129102 	   health_db    DATABASE     k   CREATE DATABASE health_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE health_db;
                postgres    false            �            1259    129879    blog    TABLE     }   CREATE TABLE public.blog (
    id uuid NOT NULL,
    banner uuid,
    description character varying(255),
    "user" uuid
);
    DROP TABLE public.blog;
       public         heap    postgres    false            �            1259    129899    content    TABLE     �   CREATE TABLE public.content (
    id uuid NOT NULL,
    blog uuid,
    preview uuid,
    video uuid,
    title character varying(255),
    description character varying(255)
);
    DROP TABLE public.content;
       public         heap    postgres    false            �            1259    129165    directus_activity    TABLE     �  CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);
 %   DROP TABLE public.directus_activity;
       public         heap    postgres    false            �            1259    129164    directus_activity_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_activity_id_seq;
       public          postgres    false    221            R           0    0    directus_activity_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
          public          postgres    false    220            �            1259    129103    directus_collections    TABLE     o  CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.directus_collections;
       public         heap    postgres    false            �            1259    129480    directus_dashboards    TABLE     I  CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);
 '   DROP TABLE public.directus_dashboards;
       public         heap    postgres    false            �            1259    129689    directus_extensions    TABLE     �   CREATE TABLE public.directus_extensions (
    name character varying(255) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);
 '   DROP TABLE public.directus_extensions;
       public         heap    postgres    false            �            1259    129142    directus_fields    TABLE     �  CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);
 #   DROP TABLE public.directus_fields;
       public         heap    postgres    false            �            1259    129141    directus_fields_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.directus_fields_id_seq;
       public          postgres    false    219            S           0    0    directus_fields_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
          public          postgres    false    218            �            1259    129189    directus_files    TABLE     �  CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);
 "   DROP TABLE public.directus_files;
       public         heap    postgres    false            �            1259    129594    directus_flows    TABLE       CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 "   DROP TABLE public.directus_flows;
       public         heap    postgres    false            �            1259    129179    directus_folders    TABLE     z   CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);
 $   DROP TABLE public.directus_folders;
       public         heap    postgres    false            �            1259    129353    directus_migrations    TABLE     �   CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.directus_migrations;
       public         heap    postgres    false            �            1259    129540    directus_notifications    TABLE     �  CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);
 *   DROP TABLE public.directus_notifications;
       public         heap    postgres    false            �            1259    129539    directus_notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.directus_notifications_id_seq;
       public          postgres    false    241            T           0    0    directus_notifications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
          public          postgres    false    240            �            1259    129611    directus_operations    TABLE     �  CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 '   DROP TABLE public.directus_operations;
       public         heap    postgres    false            �            1259    129494    directus_panels    TABLE     /  CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
 #   DROP TABLE public.directus_panels;
       public         heap    postgres    false            �            1259    129215    directus_permissions    TABLE     �   CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);
 (   DROP TABLE public.directus_permissions;
       public         heap    postgres    false            �            1259    129214    directus_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.directus_permissions_id_seq;
       public          postgres    false    225            U           0    0    directus_permissions_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
          public          postgres    false    224            �            1259    129234    directus_presets    TABLE     �  CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);
 $   DROP TABLE public.directus_presets;
       public         heap    postgres    false            �            1259    129233    directus_presets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.directus_presets_id_seq;
       public          postgres    false    227            V           0    0    directus_presets_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
          public          postgres    false    226            �            1259    129259    directus_relations    TABLE     �  CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);
 &   DROP TABLE public.directus_relations;
       public         heap    postgres    false            �            1259    129258    directus_relations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_relations_id_seq;
       public          postgres    false    229            W           0    0    directus_relations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
          public          postgres    false    228            �            1259    129278    directus_revisions    TABLE       CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);
 &   DROP TABLE public.directus_revisions;
       public         heap    postgres    false            �            1259    129277    directus_revisions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directus_revisions_id_seq;
       public          postgres    false    231            X           0    0    directus_revisions_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
          public          postgres    false    230            �            1259    129113    directus_roles    TABLE     }  CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);
 "   DROP TABLE public.directus_roles;
       public         heap    postgres    false            �            1259    129301    directus_sessions    TABLE       CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);
 %   DROP TABLE public.directus_sessions;
       public         heap    postgres    false            �            1259    129314    directus_settings    TABLE     �  CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json
);
 %   DROP TABLE public.directus_settings;
       public         heap    postgres    false            �            1259    129313    directus_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_settings_id_seq;
       public          postgres    false    234            Y           0    0    directus_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
          public          postgres    false    233            �            1259    129560    directus_shares    TABLE     �  CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);
 #   DROP TABLE public.directus_shares;
       public         heap    postgres    false            �            1259    129645    directus_translations    TABLE     �   CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);
 )   DROP TABLE public.directus_translations;
       public         heap    postgres    false            �            1259    129124    directus_users    TABLE       CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);
 "   DROP TABLE public.directus_users;
       public         heap    postgres    false            �            1259    129652    directus_versions    TABLE     �  CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);
 %   DROP TABLE public.directus_versions;
       public         heap    postgres    false            �            1259    129342    directus_webhooks    TABLE     �  CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);
 %   DROP TABLE public.directus_webhooks;
       public         heap    postgres    false            �            1259    129341    directus_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.directus_webhooks_id_seq;
       public          postgres    false    236            Z           0    0    directus_webhooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
          public          postgres    false    235            �            1259    129927 	   encourage    TABLE     b   CREATE TABLE public.encourage (
    id integer NOT NULL,
    motivation character varying(255)
);
    DROP TABLE public.encourage;
       public         heap    postgres    false            �            1259    129926    encourage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.encourage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.encourage_id_seq;
       public          postgres    false    252            [           0    0    encourage_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.encourage_id_seq OWNED BY public.encourage.id;
          public          postgres    false    251            �            1259    129867    user    TABLE     �  CREATE TABLE public."user" (
    id uuid NOT NULL,
    username character varying(255) DEFAULT NULL::character varying,
    gender character varying(255),
    weight numeric(10,2) DEFAULT NULL::numeric,
    age integer,
    frequency character varying(255),
    profile uuid,
    bmr numeric(10,5),
    tdee numeric(10,5),
    breakfast integer,
    lunch integer,
    dinner integer,
    result integer,
    height numeric(10,2) DEFAULT NULL::numeric,
    "user" uuid
);
    DROP TABLE public."user";
       public         heap    postgres    false            �           2604    129168    directus_activity id    DEFAULT     |   ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
 C   ALTER TABLE public.directus_activity ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    129145    directus_fields id    DEFAULT     x   ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
 A   ALTER TABLE public.directus_fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    129543    directus_notifications id    DEFAULT     �   ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
 H   ALTER TABLE public.directus_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    129218    directus_permissions id    DEFAULT     �   ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
 F   ALTER TABLE public.directus_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225                        2604    129237    directus_presets id    DEFAULT     z   ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
 B   ALTER TABLE public.directus_presets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    129262    directus_relations id    DEFAULT     ~   ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
 D   ALTER TABLE public.directus_relations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229                       2604    129281    directus_revisions id    DEFAULT     ~   ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
 D   ALTER TABLE public.directus_revisions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231                       2604    129317    directus_settings id    DEFAULT     |   ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
 C   ALTER TABLE public.directus_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234                       2604    129345    directus_webhooks id    DEFAULT     |   ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);
 C   ALTER TABLE public.directus_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            &           2604    129930    encourage id    DEFAULT     l   ALTER TABLE ONLY public.encourage ALTER COLUMN id SET DEFAULT nextval('public.encourage_id_seq'::regclass);
 ;   ALTER TABLE public.encourage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            H          0    129879    blog 
   TABLE DATA           ?   COPY public.blog (id, banner, description, "user") FROM stdin;
    public          postgres    false    249   �      I          0    129899    content 
   TABLE DATA           O   COPY public.content (id, blog, preview, video, title, description) FROM stdin;
    public          postgres    false    250   �      ,          0    129165    directus_activity 
   TABLE DATA              COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
    public          postgres    false    221   �      &          0    129103    directus_collections 
   TABLE DATA           *  COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
    public          postgres    false    215   #      =          0    129480    directus_dashboards 
   TABLE DATA           f   COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
    public          postgres    false    238   �      F          0    129689    directus_extensions 
   TABLE DATA           <   COPY public.directus_extensions (name, enabled) FROM stdin;
    public          postgres    false    247   �      *          0    129142    directus_fields 
   TABLE DATA           �   COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
    public          postgres    false    219   �      .          0    129189    directus_files 
   TABLE DATA           �   COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
    public          postgres    false    223   C$      B          0    129594    directus_flows 
   TABLE DATA           �   COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
    public          postgres    false    243   `$      -          0    129179    directus_folders 
   TABLE DATA           <   COPY public.directus_folders (id, name, parent) FROM stdin;
    public          postgres    false    222   }$      <          0    129353    directus_migrations 
   TABLE DATA           I   COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
    public          postgres    false    237   �$      @          0    129540    directus_notifications 
   TABLE DATA           �   COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
    public          postgres    false    241   *      C          0    129611    directus_operations 
   TABLE DATA           �   COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
    public          postgres    false    244   #*      >          0    129494    directus_panels 
   TABLE DATA           �   COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
    public          postgres    false    239   @*      0          0    129215    directus_permissions 
   TABLE DATA           v   COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
    public          postgres    false    225   ]*      2          0    129234    directus_presets 
   TABLE DATA           �   COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
    public          postgres    false    227   �,      4          0    129259    directus_relations 
   TABLE DATA           �   COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
    public          postgres    false    229   t-      6          0    129278    directus_revisions 
   TABLE DATA           j   COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
    public          postgres    false    231    .      '          0    129113    directus_roles 
   TABLE DATA           w   COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
    public          postgres    false    216   xH      7          0    129301    directus_sessions 
   TABLE DATA           b   COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
    public          postgres    false    232   I      9          0    129314    directus_settings 
   TABLE DATA           �  COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides) FROM stdin;
    public          postgres    false    234   %J      A          0    129560    directus_shares 
   TABLE DATA           �   COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
    public          postgres    false    242   ~J      D          0    129645    directus_translations 
   TABLE DATA           I   COPY public.directus_translations (id, language, key, value) FROM stdin;
    public          postgres    false    245   �J      (          0    129124    directus_users 
   TABLE DATA           T  COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
    public          postgres    false    217   �J      E          0    129652    directus_versions 
   TABLE DATA           �   COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
    public          postgres    false    246   LL      ;          0    129342    directus_webhooks 
   TABLE DATA           o   COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
    public          postgres    false    236   iL      K          0    129927 	   encourage 
   TABLE DATA           3   COPY public.encourage (id, motivation) FROM stdin;
    public          postgres    false    252   �L      G          0    129867    user 
   TABLE DATA           �   COPY public."user" (id, username, gender, weight, age, frequency, profile, bmr, tdee, breakfast, lunch, dinner, result, height, "user") FROM stdin;
    public          postgres    false    248   �L      \           0    0    directus_activity_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directus_activity_id_seq', 271, true);
          public          postgres    false    220            ]           0    0    directus_fields_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_fields_id_seq', 40, true);
          public          postgres    false    218            ^           0    0    directus_notifications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
          public          postgres    false    240            _           0    0    directus_permissions_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.directus_permissions_id_seq', 40, true);
          public          postgres    false    224            `           0    0    directus_presets_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.directus_presets_id_seq', 2, true);
          public          postgres    false    226            a           0    0    directus_relations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_relations_id_seq', 9, true);
          public          postgres    false    228            b           0    0    directus_revisions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.directus_revisions_id_seq', 251, true);
          public          postgres    false    230            c           0    0    directus_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);
          public          postgres    false    233            d           0    0    directus_webhooks_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
          public          postgres    false    235            e           0    0    encourage_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.encourage_id_seq', 1, false);
          public          postgres    false    251            h           2606    129883    blog blog_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_pkey;
       public            postgres    false    249            j           2606    129903    content content_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.content DROP CONSTRAINT content_pkey;
       public            postgres    false    250            6           2606    129173 (   directus_activity directus_activity_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_activity DROP CONSTRAINT directus_activity_pkey;
       public            postgres    false    221            (           2606    129112 .   directus_collections directus_collections_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
 X   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_pkey;
       public            postgres    false    215            L           2606    129488 ,   directus_dashboards directus_dashboards_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_pkey;
       public            postgres    false    238            b           2606    129694 ,   directus_extensions directus_extensions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (name);
 V   ALTER TABLE ONLY public.directus_extensions DROP CONSTRAINT directus_extensions_pkey;
       public            postgres    false    247            4           2606    129153 $   directus_fields directus_fields_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_fields DROP CONSTRAINT directus_fields_pkey;
       public            postgres    false    219            :           2606    129198 "   directus_files directus_files_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_pkey;
       public            postgres    false    223            T           2606    129605 .   directus_flows directus_flows_operation_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
 X   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_operation_unique;
       public            postgres    false    243            V           2606    129603 "   directus_flows directus_flows_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_pkey;
       public            postgres    false    243            8           2606    129183 &   directus_folders directus_folders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_pkey;
       public            postgres    false    222            J           2606    129360 ,   directus_migrations directus_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY public.directus_migrations DROP CONSTRAINT directus_migrations_pkey;
       public            postgres    false    237            P           2606    129548 2   directus_notifications directus_notifications_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_pkey;
       public            postgres    false    241            X           2606    129618 ,   directus_operations directus_operations_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_pkey;
       public            postgres    false    244            Z           2606    129627 5   directus_operations directus_operations_reject_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
 _   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_unique;
       public            postgres    false    244            \           2606    129620 6   directus_operations directus_operations_resolve_unique 
   CONSTRAINT     t   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_unique;
       public            postgres    false    244            N           2606    129503 $   directus_panels directus_panels_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_pkey;
       public            postgres    false    239            <           2606    129222 .   directus_permissions directus_permissions_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_pkey;
       public            postgres    false    225            >           2606    129242 &   directus_presets directus_presets_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_pkey;
       public            postgres    false    227            @           2606    129266 *   directus_relations directus_relations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_relations DROP CONSTRAINT directus_relations_pkey;
       public            postgres    false    229            B           2606    129285 *   directus_revisions directus_revisions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_pkey;
       public            postgres    false    231            *           2606    129123 "   directus_roles directus_roles_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_roles DROP CONSTRAINT directus_roles_pkey;
       public            postgres    false    216            D           2606    129307 (   directus_sessions directus_sessions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
 R   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_pkey;
       public            postgres    false    232            F           2606    129325 (   directus_settings directus_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_pkey;
       public            postgres    false    234            R           2606    129568 $   directus_shares directus_shares_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_pkey;
       public            postgres    false    242            ^           2606    129651 0   directus_translations directus_translations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.directus_translations DROP CONSTRAINT directus_translations_pkey;
       public            postgres    false    245            ,           2606    129530 *   directus_users directus_users_email_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_email_unique;
       public            postgres    false    217            .           2606    129528 8   directus_users directus_users_external_identifier_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
 b   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_external_identifier_unique;
       public            postgres    false    217            0           2606    129133 "   directus_users directus_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_pkey;
       public            postgres    false    217            2           2606    129538 *   directus_users directus_users_token_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_token_unique;
       public            postgres    false    217            `           2606    129660 (   directus_versions directus_versions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_pkey;
       public            postgres    false    246            H           2606    129352 (   directus_webhooks directus_webhooks_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.directus_webhooks DROP CONSTRAINT directus_webhooks_pkey;
       public            postgres    false    236            l           2606    129932    encourage encourage_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.encourage
    ADD CONSTRAINT encourage_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.encourage DROP CONSTRAINT encourage_pkey;
       public            postgres    false    252            d           2606    129871    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    248            f           2606    129941    user user_user_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_unique UNIQUE ("user");
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_user_unique;
       public            postgres    false    248            �           2606    129894    blog blog_banner_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_banner_foreign FOREIGN KEY (banner) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_banner_foreign;
       public          postgres    false    223    3642    249            �           2606    129904    blog blog_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_user_foreign FOREIGN KEY ("user") REFERENCES public."user"(id) ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_user_foreign;
       public          postgres    false    3684    248    249            �           2606    129909    content content_blog_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_blog_foreign FOREIGN KEY (blog) REFERENCES public.blog(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.content DROP CONSTRAINT content_blog_foreign;
       public          postgres    false    249    250    3688            �           2606    129914    content content_preview_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_preview_foreign FOREIGN KEY (preview) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.content DROP CONSTRAINT content_preview_foreign;
       public          postgres    false    223    3642    250            �           2606    129919    content content_video_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_video_foreign FOREIGN KEY (video) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.content DROP CONSTRAINT content_video_foreign;
       public          postgres    false    223    250    3642            m           2606    129532 7   directus_collections directus_collections_group_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);
 a   ALTER TABLE ONLY public.directus_collections DROP CONSTRAINT directus_collections_group_foreign;
       public          postgres    false    215    215    3624            �           2606    129489 <   directus_dashboards directus_dashboards_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_dashboards DROP CONSTRAINT directus_dashboards_user_created_foreign;
       public          postgres    false    217    238    3632            p           2606    129445 ,   directus_files directus_files_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_folder_foreign;
       public          postgres    false    223    3640    222            q           2606    129376 1   directus_files directus_files_modified_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_modified_by_foreign;
       public          postgres    false    223    3632    217            r           2606    129371 1   directus_files directus_files_uploaded_by_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);
 [   ALTER TABLE ONLY public.directus_files DROP CONSTRAINT directus_files_uploaded_by_foreign;
       public          postgres    false    3632    223    217            �           2606    129606 2   directus_flows directus_flows_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.directus_flows DROP CONSTRAINT directus_flows_user_created_foreign;
       public          postgres    false    217    3632    243            o           2606    129381 0   directus_folders directus_folders_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);
 Z   ALTER TABLE ONLY public.directus_folders DROP CONSTRAINT directus_folders_parent_foreign;
       public          postgres    false    3640    222    222            �           2606    129549 ?   directus_notifications directus_notifications_recipient_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_recipient_foreign;
       public          postgres    false    217    3632    241            �           2606    129554 <   directus_notifications directus_notifications_sender_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);
 f   ALTER TABLE ONLY public.directus_notifications DROP CONSTRAINT directus_notifications_sender_foreign;
       public          postgres    false    241    217    3632            �           2606    129633 4   directus_operations directus_operations_flow_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_flow_foreign;
       public          postgres    false    3670    244    243            �           2606    129628 6   directus_operations directus_operations_reject_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);
 `   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_reject_foreign;
       public          postgres    false    3672    244    244            �           2606    129621 7   directus_operations directus_operations_resolve_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);
 a   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_resolve_foreign;
       public          postgres    false    3672    244    244            �           2606    129638 <   directus_operations directus_operations_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 f   ALTER TABLE ONLY public.directus_operations DROP CONSTRAINT directus_operations_user_created_foreign;
       public          postgres    false    217    3632    244            �           2606    129504 1   directus_panels directus_panels_dashboard_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_dashboard_foreign;
       public          postgres    false    239    238    3660            �           2606    129509 4   directus_panels directus_panels_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_panels DROP CONSTRAINT directus_panels_user_created_foreign;
       public          postgres    false    239    3632    217            s           2606    129450 6   directus_permissions directus_permissions_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_permissions DROP CONSTRAINT directus_permissions_role_foreign;
       public          postgres    false    225    3626    216            t           2606    129460 .   directus_presets directus_presets_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_role_foreign;
       public          postgres    false    227    3626    216            u           2606    129455 .   directus_presets directus_presets_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.directus_presets DROP CONSTRAINT directus_presets_user_foreign;
       public          postgres    false    227    3632    217            v           2606    129465 6   directus_revisions directus_revisions_activity_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_activity_foreign;
       public          postgres    false    3638    221    231            w           2606    129406 4   directus_revisions directus_revisions_parent_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);
 ^   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_parent_foreign;
       public          postgres    false    231    3650    231            x           2606    129677 5   directus_revisions directus_revisions_version_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.directus_revisions DROP CONSTRAINT directus_revisions_version_foreign;
       public          postgres    false    3680    246    231            y           2606    129584 1   directus_sessions directus_sessions_share_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_share_foreign;
       public          postgres    false    232    242    3666            z           2606    129470 0   directus_sessions directus_sessions_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.directus_sessions DROP CONSTRAINT directus_sessions_user_foreign;
       public          postgres    false    3632    217    232            {           2606    129416 8   directus_settings directus_settings_project_logo_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);
 b   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_project_logo_foreign;
       public          postgres    false    234    223    3642            |           2606    129426 =   directus_settings directus_settings_public_background_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_background_foreign;
       public          postgres    false    234    3642    223            }           2606    129684 :   directus_settings directus_settings_public_favicon_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);
 d   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_favicon_foreign;
       public          postgres    false    234    223    3642            ~           2606    129421 =   directus_settings directus_settings_public_foreground_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);
 g   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_public_foreground_foreign;
       public          postgres    false    234    223    3642                       2606    129520 B   directus_settings directus_settings_storage_default_folder_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;
 l   ALTER TABLE ONLY public.directus_settings DROP CONSTRAINT directus_settings_storage_default_folder_foreign;
       public          postgres    false    222    234    3640            �           2606    129569 2   directus_shares directus_shares_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_collection_foreign;
       public          postgres    false    242    3624    215            �           2606    129574 ,   directus_shares directus_shares_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_role_foreign;
       public          postgres    false    242    3626    216            �           2606    129579 4   directus_shares directus_shares_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.directus_shares DROP CONSTRAINT directus_shares_user_created_foreign;
       public          postgres    false    217    3632    242            n           2606    129475 *   directus_users directus_users_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.directus_users DROP CONSTRAINT directus_users_role_foreign;
       public          postgres    false    3626    216    217            �           2606    129661 6   directus_versions directus_versions_collection_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_collection_foreign;
       public          postgres    false    215    246    3624            �           2606    129666 8   directus_versions directus_versions_user_created_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_created_foreign;
       public          postgres    false    246    3632    217            �           2606    129671 8   directus_versions directus_versions_user_updated_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);
 b   ALTER TABLE ONLY public.directus_versions DROP CONSTRAINT directus_versions_user_updated_foreign;
       public          postgres    false    3632    246    217            �           2606    129874    user user_profile_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_profile_foreign FOREIGN KEY (profile) REFERENCES public.directus_files(id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_profile_foreign;
       public          postgres    false    3642    223    248            �           2606    129942    user user_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_user_foreign;
       public          postgres    false    3632    248    217            H      x������ � �      I      x������ � �      ,   0  x�՝Ko#�Fך_����5�~tVAI�8Y8@�0`PbkF0-
�f�_�ꇄ����6À1<��U�����_o��k���Z��]���ԧ���isߗ��pc�ukc׺����W&���tclR��en~���a��|J���as����?|��ꯏ/�nU���?���2�g~N߯������������spI����o����j��K��s����՟�>��?S�?G�~��o����f���߽|;����?N���7__^��ϟw��������e�'{s��o^����:�U4���?������6��3;��p����=�7O����]���^��;�UJ�
�п�<<~�/=�|{ڶS{[��:�(�I[��:I�Cgb��G�[�k�:_GxE�\��<���f6F]_uV�p����ׇ�a���>y�%��4;�U�sț���j.[[�{@�,-�@K��/�c���|�-N{*�sl[\jo�%x���͋��]�
���������>u6(�����i��m���Kg*%�^��7�M��g�ʚ����c�����?�y�4$�K�*�����Ǣm4�as��e�������:�Vo��߯��۬�}%)�۲���}%�d�o�ci����/�6��X��y8�e��!O�<��ק�$π�M��ȹ��%x�m
x�Kn4@o�#���G�(v��9F�l��C� ��|G�����^h�s��.l�{�$�X^t���"W�gx`rAnr��}�\��\�p��C�����&�����]8��rT.�U.����QB^�r��N��\��\0�k��E����3�\��\��˺*�*�eS�B*Ϡr��6\.���1:p�x�sğ:p���rnem���O\F3g'��֨qK��e�JE�����tg�*�kU��i:g��?�8��?�t��a�2ר?����&j3��`�&�y��n	}������C�纺���B�f�F���m�+0YV}��`S��-��O��p |�ȍ�Ϋ�����En�E�ĵ���@�sc$n�������Tv�E���6QWg��6��vc��_p����x�NN͹'SY�bhc)_5���mt�2�����F��Dn;]Wj���+5H�d�����n���S�A�$��,u:(o)�2t
&K�̕����+5�*��y=�yH��D����:�SFW����M̖���	ZV$Z6S{����ZV$Z6Cg��?궢KjG� ~_FK[͉#h�U�hi�9qD]88�ђ���^���"���#]��Z�8�8�Q��fV���c���B7������B9����]&|_Ό��@͕�{_S��Y�	��8PR��z6`��
���~Vف���h��Ԥ.��$i��ؙrB��f��Våk�C�k�M�a<��V���Z�C&�TU�D�X�����!c7\��H����a(���Nb�b#I3���	{L�]�}�i�v!�1��J��2��6�gLcns�.���d�-^�a	����m�9�mt%ΘFI{���V"�FM�Q�ް������m��(ڄ�:c�ۦL�@I������t]�8�� o��ag�9�V�A�G���ܦPb�A�I���N$)KV��$��Hڄ]�SӤ'� �D��x�4Ȁn��I{�C$���k��M�Qsn:���Imƾp��3$����fjΌ
08��Mԉ��9����d4O	:���ؤ{NapA��9�h0�$�6agλ 0�S�Klǹ�Di '7�LVO�wrG˜����{��e��HҼ\��{�#��V�zA���rK+�r݆y /���yF���]�b^*i����)1/�4���˗��*u�����%U4�"i�cRE�؜�|cREs*i�3�(���V�Ɋ?��	REsWZ	REs*sR×-7�L��Qd%��
��Anh%q�ѐ���y�9�0���V�9"0���V�9�'�C�:Z��\�`�!��t6�x���ɣ���0�;���'a�-�ȃ��p�"I����["iNwڨ��_��8�O��/�,bZ�,�W�aY��v�������C%��|s�KC=UL�Ț/����E�Xk��u�,��]�؜G��t�$�6QS���3I<mf�,�I�i3�����fl��(=�$Ѵ	;s����$���؞�mClI4m�&����g���J�^��S`�]HK2 1m�*��6׷�nm+���<����؜�/� �rK+�ǋ��e���+Ld��yU8O*��\*i��e�C�JZe�L���H-�f<����^`AM�Y�Ck�%4i�O�v�6Xb�5(=e��b`�m9#0���c`��ٰVZ�,�e
VZ�,���bk���#�!1mm4���р���>K�H��D��g`�M�l�]�mm4����P���6X`{�c�(�`[;�a'����mm5���j��ܶ�Xbsn�Q\Ŷ�X`GM)+pՖ*Z��l�m��%�HS_��n�4��&=Z�m#U��͙B!��i`��)?mb�F�hIe��[�h�s���5rE˜חQ������NA�b䊖粍l����|rQ��	�pVd�!Q���3h
C��Ԅm;�ל	4�[+���m?�Ҧ��V��b��J���-��E�|��P��k�^���v��H�&z�P��߬�t��3NY�/ݡU\�x`�N\�����������ΧOCт�(65Fdo;)c)3�膯5!��9����-�B0a[C���#jC0cs�á�8���)�F�m;Pu�f�{(?�Y�ӡ���4���ӕ��CU'��9�8SD�_�[��r����Za+�v�)o�e�
r�.d�-'6J�z-�c/�b��$��(��%��,��܉��w�oϛ/=z�h[0�
NZ��!M5$�Q9҆�;��Z��j6p��sQC���wNz�����B�Q9Sb{�-�P�����n76���<�	.<��[�6C=�A>$��|��3z�7}X��ַ����`��}�c@/hZ0>�`�����iA�v�
g��	���v��U&^����n#�O,۵1Qx{_��uem��f��V�K����[mBo�������c�=�B�()hf0a�?�R���Tgh����տ��d.��?��p8��W�B�)ԉ��
�ˎK�={:���va��~��؝Ҟ�S?bG�����ؽ�dY�#v4���@���!��sĎ��=B7�'��l�#���؋�����Qp:��m��ٝW�LkN��	։=+�;�G�(2-h0����1�=I����V%���]�uv�c����c�ɸ��N�,zq2{i���HVH`�#���#{����]��O�ӧO��ƾ�      &   M   x�+-N-��4 ��J��99P�!��/H���J��O'Z�������Լ��CBj^r~iQbz*�&��qqq �)Ao      =      x������ � �      F   A   x�K�,JM.)-�M�(I�+����M.-*J�K����+I-JKLN�,�J��.?���$5E]� �[s      *   E  x��W�n�6>+O=X��F���R7EH�֎E�X�"eK�^�rvh��A�-�EO]�(Т���m�(�HY����(Ґ�7��pf����Z��"��i7W�������,����6�t��1Z0DI1�G�_���u��	�d�C�b0�t�-�
ٝ�`��>���~wW��.nď�j��jڜfmvW.x�a�U7E��Z�U�ؒg	���p�fno0�(��~�Ea�K��|uS_�8��וY�poB)X=�/��0�#�*�r`'�ړ�0�/RH�W^W��&�~��������Z\����y�O�}+^�ͳ7�����ۖ{�g�ٯ���ןB�k��$���kN�µ�GP�u���{E�Nq���<���F���<�!_�'�/^��kx]�����8�vO��4�Ј��G��G���&g����h�qKƲysS�0L�6�������5�\��n׼�\\?������{�-D�93���3�Bv\v�}���q������(m�>@�����Ӏ�G���S҄�h�$"�!�G�S������K�+;nV咾t3��<�utu�
_���'��m3��c�� ���<�m�yJT��s�0�68�Q����Sm��بAyb�?��5�FE�rN$NI0o�{
|Y0 "D�C���zU�d����o�1t*�%�n���X�)܊b�%���
��)u�nEu���KO�GӸP�[��	��b�~� �-}�%�|�r�c����2���Շ�*	��$�*HMj�)#�Pz�����S��JЗ�̸�)�y�������V�G��C��a����EK?nY�p�%����h� u�Q���I��xi�-ln'#p�3Bh�K�i�>@iR��Ea=MF�0�PRtL>F3b!��bR�Ê��Π�nՆ4����XI:)B�</���k���N�Q�be�����:!'�	yd�ݚP��f�`<���|@��� �E��^8�G�3� ��! ^�>���d4:��~6������L��Ph�OC'�M�#M�-@����u{�S�q^sm��x��_#��!�����/��;e�:M���U�4�o�GGG��ߏ�      .      x������ � �      B      x������ � �      -      x������ � �      <   \  x��W�R9]�Wh?���zdg��P�
��f6���v��	���rw�Eb6,(���<�6�L�����ܓA3Wf�XW�KW�)���>���w���
a���9{/����s�Ѩ@�x��C��О+�g�
㧿��h����o����3JT �O�&�5��z��o�Aa�eL2=�mu�1�s�u���^����$�y.�  �^EW5]	%s�B���ѬO�@b���N�����hi~6	���1~`��L�EWec�']$�<W4�3������S�_}i�B��k'���Gp�70
|�Z��l��-l�|��P,��P�C]z������5�1��R��LT�fJ�I�G�Mծ��2�L�dR�,�䣭�B���m�$(2Ai:Qǰ;�hY���T	8W2
��?��!���8���SE?�Wem7�TԒ	1N�_�0f�f�+���v�@�+و�Ю~a��M�jv��d㰈q�ʵ�rn�ɕS�FMC�.̃n�tW�M�Z�S2B%>꾀C�*��S/*�e�+������L�=�ۯus�Q�cq��.^�4���F�F�a�<���/�'�v���O�Z��q��צA��6~0�]��r����P�I�l�M�l�K
� zUa���/�9�[��s66Mym����n�`N�i�	�d*z���}�E�ߥ8�,Bg�/5�Zmti�)�e����nr`�_�/�<��W�~.r�U�kK~p"l)��%�7���2��#�`�USѤ\��'Pt�.�n��.���*���MtW����|W�
-ݣI$�r>��L�D{�����s�Y�ώ��5�X��2��LH,F���`6�]��=�q����A[]%|V�<�c�0���?��^Uv�$LJ���pa��� �S��w�8�|��읮;����$Qa3������tYw��S(y����7�;���<�+]�:��)"�^;�o�����%-J�������we&I��p�kp�l�8X�,��a�G!rX�]��ЊSQ�7��p?a+�#�����o�p�x􅱘bvvQ�=�Jy�qtY���A��nO�;W�3]cZ��ǳ�a\}y��$#���X>�L?>��I��n�q�7I������u�w���-�,b����u�M�_�[O��Ia�C{i�Z��Ч��7E�cL�P�&�r�ß�k�o��<65�p�=Y�Û�Xs�q���`�n7��mR�9@,T�8����m�b4|P���DN�� }g��{�a��<��|Xn����`G��;��K=[|h[��3�ј!�a�_���`)���7��?!�:��t���???��cd      @      x������ � �      C      x������ � �      >      x������ � �      0     x���O��0���1�=�Hȟ%�V�U��vOM�&x ��ڦ{���6�]��Ce~o���,��� ��$b��|����,L���ixp(��\E	㨜X"ht.Wg�-?���(N��mJ8����C7�Q��s��%��:H��=:��Y]���xZ�ksK�2低-Ƒ:n-�qz��zM�q�:�S��6Y�F=���݀�F�a7�G��[7�{�z_g��Ƽ�0J���&O__w���g��c�#W#�0�t��	=���q�J�	I=.b�Ld�f��GQŒ��_�/h�Ei�搢��X��"��صخ�}w6��+u�pH$$Y����c����Ma���C�sN�Z�x��n�a��u�l��&5�-gݸ���г��ZϤ�Z�zŹxk�%KS�w�d9� �^U)��U$�W׺�����E��mF��l�=��M^����^c���.f��e�{�f�l�x`<�:��V�7�� �բ�?������eqqg�f��J�s,Ō���71�I�Ǐ���q]��W�      2   �   x��O�j�0<�_a���1�G��`V�:��V����*���¢юF;�������N��F�i�r�@Csꆓh'�R�/�)�Z!���&K�D�?p��P�#�3�e��_����Í�U�gc��X���h&r��чT"Ќ���w�Ȗ�w*��Pk��4j�#Λlb����dCLc	_o[̈́ÿ��1���e�~�&�߅�۞?��z�Tp�      4   |   x�3�,-N-�,(�O��I�L�,JM.)-��9c�PP^iNNfZ%�D��� �p�0�L��O�LJ��Cփ�S��U8ԙq&�畤�@� 8��Õ��e������̔�|"u��qqq ��p�      6      x��][��r~����s���H��O���$�����!8�0Ԗܭ���Zr�n� rAAr� @�<$y��7���eҒEҗnْ�����B��EV�W2���h�-��8�&aj �S/M�Y��{qF��i6_D��<
�d:�����Y4��w
�-�^��΢QLz���-q��������p�L&�_�@���<Ǔ�w�H����)xP<��AJZ<=�D}}L�h�(v}t�91���4�2x})x���2�(�Û���W�+/�D}o٪e؊V��ż�ipI��{�W�Ý���d�W�Vܙ$������$��<:�'�iX�q�~�ޘ&Y�/�삶O�A�E��,�b�ݘi�1���Y/��_J�d�GC�e�lLS��(&�^��l��R��h�/��4�6F�`1�`D�0��gA]���������ъ��$\L"���0JG�x�%�;��I0=_@�@s4|x�[Pφ� )��:��GT��f�( .�S��{�Et'��EV���o�i|Pf�&W�|������G~��R}��펽s5�G��V����%�o�ltѐ*�)����Vg�����W��wQeu#wT좙ݺ������ī]޲�c� �I[�|�\����i T�b�/�4���t(�dmi6���0�V�t��%ݶ���~�����I˷>]_���}�,/ړ��?�h��	.2���IG�px�޹6`l "��'%#��|�n؀��,���=)I/����{�^�_k�l.Q{�2kY���nu��&?�����l�xr��>��/h��9֫c_�u��&o�v���5��w�4ߩ"��f�k<��(X�����8�h�v����v���Z���%��Fݗ1���fu�J����1j=�RLVZ^uI&0&���LeN-�eov�j��"߰l9���Id�fC:H�,�f�#g��;��TC:P��EȰ\9���I\�Cbс�g,�)�����0H/Β`6i��Js\�l��3�}��������M�<�r�&�(<�#������eO�p�� m�q����- .�n��9J.��(�MfӔ��L���>}z��޿}����,�����<������8Ҭ�s�����������`"f����!Π�����N`�X�t_xHca;q�b�YQy�9��`��*ݎxgZ�!^�a���Xw�̈��F�i���_9"	�S�a�B.xO2��u9*�[�a+r��I�w1G%�q�1lE�YJBg�4�4��9�K�a+�b�ރȣک#u�8���5Gj�\$����h0.����Α�=�<�]:�b��IG��<��h��h0>!�Vx�h��.Ry�pϑ�g<�pձ�U��x���(`|"��؍c�n\B��2�1uu�8a�b��ջm�57���;�m8���z-P�����7�~�g~���۷��}?���������x�2TL�7	��G�AL1$zBo'�e&����,�^9�cy5�
�`�7�PA�?�i�<;��7��8���8����3S�ͯ���������j_#Oo'�7�H��𔳠Zo�{�V�c�������$�����j_G⑷�G#�q�7���վ�H��4R:\�`G#yP^6J&�F�����o���O��㍒�8�G���$��������9���!\�E¯ў�b�b�CK�0|B�o��诚��=������`S���5��p|9H��M�e�%ס~���ׯ_�V�aw�p����*�Z�m���z����Z��׫�L�Vz�.E�-���Z.��ኸ"��Ɂ'ǔ 됍�7\W�~��v������3W�z{���Oh"�ل�YF��Erߥ6Bd�"4�_�Oj�c�>N'l���La��@�܇��RXv�N�@��!���{wskq(��2�WP8���l�R�9�<U5�&deY>�av}���!�CL�����Xtø�g!��t�3�w�U/�+��(M󥟯����.u��ex��2L�4w��$	c�	���C5
e)�ɤ�3N�L2����	��ň6-����	�I�1<K�Q��;Z���buG(e�q�erqO���~��y4׶�56�����F�ݹw��܏�>D�l�ቨ|TTf����2��Zd����[jT�ӽ{wH����������2*B��zwiD���d&�bǥ���E��g�Z]�3��~��ۛ���7�7�����������������u��no~�������z4��Z@������w{󏼭�ȯ����?������/5��M��}�&H�	g�ޡ	���V������M��w����7w��o������~�~W����	�M�SsMG���J��A��Mvl����2Ţ�A|��l+}�.�b�� �����nbk�D�2|�&��Mtm��nb��D�1|�M̭r>W��,�Ԅ*�mg����68��k����5G��δy[.��%>�*!�v򨛖�ӡ�R���.�o��s���bM���X
�q�%b�L×D*�%�ѴT�I�bM(�\(��%�����iZ$~�D����	��"q�m.{W�{�\� ����"�R�̠nng�ƚ�ȗ�3D�ZZk�,����1��� miS��s@$:+ߤ3/�x.F���l��x�q�`�x�灈t��u��N�#.����&�E�\Zr�HE�\Zs�1�!:�c.:梈��f�sA��)t�3�~��կ?�x�t���?�&�Iu0?�q��|x���?}�gOy���k��	\^^����'�5�����cN�-��s�3Gl�˒6-�=oSu���e���,�y��O��3�H�� �Qy$�l0.c�]�ƋhS��.]�An�ˋ'�5h1Z{i�᲏�[�*}m���>�$Wړ'i��d��4��(�7� �)��3J}��&�1M��gS&��t�t�C���E�/��-*i��,\Da�ê�v��x�����;�|v�Vw��V�m����c�$�Z�'��v��}im����qTy�]�}�{��pX9�yc��(AF����;� ��W}T2�0���>�W��Cĵ�ǈ�-y��r��1�0���)��7�[�����4�͖�8��s�[Y��%���,�z�������|���Ѽ{d��w���鞟��[#Q��Mi͐��Q��H�%����ձ�#m3����!��uǋ�Ev������z:�k��*���<�%�ǖ���܃�.�l��li���y�ғ@O�G0	��A`�Pd�r�kN�F���{�&�bVrn�&o�-ο��cs���%��!�C�,�$��CEG�M�^V���\�X�֧C2��c윳�i����P����_��A�	�	I¾����_����:�k��XG�ӵ*=lUb��"�ڲf�׫o_�	}�=�4�_N������N�lE����F�1I����-�w��Vm��.r�\ɏ��E�Kj�[`T�E���hN�>i}�ӹ���IN�h�!ӻ��~��3�UX��Q����Ǽ��[3����T?�Sg�l |W,�����N�G ,)�G6~� -3FD��3�;C���""���!�M"HK0����)��9E!d$)ׇ'��h���	L=D$yV}8a��"�`$�^}:a��Ҫ{D$�+}<aS��
zD$���	����|�eRK\LtH���� ə�����������cE�Ti	(��h�VЖ�Jq�Q�; ԥ�`��mE�T@H�`(�[�9޻y�t)��bيt�`l����T���߼d��(x��]*D#@t=�.�h� �K��B�W�Kg��L6�)��S��و���l0�IL�����)��S��d$`��lO
�`ْ�Na>�&! mIXB�0Na#	Gt���S9�h�$&�A0�G�r�]Jc���L�X$X�.�;�@+'�U�3�P$8�]���.�]V$3��A�s=�.U��+B_�͕@�t^��[���LPZ��":ߒ4��@@�#4t��4���H>������m�3�d�8E����c\�d=�N/��^v�< c
  �\[�ٕ��n	\�	0K�xĵ�,h�Bm�˂Y&)V�[�F����k�Zi���9%�fM���fM�o�j�����z���M�>m(��T����o���'�������R�W�Q�fo|�R�U
�^���w��tXXk��̖h&7�.W	�-�Vv�����0��/mRax�(^۠����xk�
�+��5��]0�Z3�fn3�W	��u�ռ�
�/����k�����N*,��U�S�Uk��L�q���J�e���n�ę�y4X.��Y;�emV�M��r�X��	,(!��GS�>I	���(K
�*��s�_l W�[�c��:v�& I��.�n�۶@6b�Y�a7X�m� 1W�˰/ö��$د˰�S�m� #I�P�a?�2l�iK����2l W�a]��`�n�+)��R�o���w8K�A ��.��WW�>�R��ϒv��<I�y�-;o�S,��^V�Cţ-��l�X����$���������Zm�ݕ�c�$�NE�=UCշc��K`���%Uߎ�$��������a��^�cq�5���g<�#���e�4+k�z~�-�p�vA��8�.�o�l��@4b�UW��Jp]	^[%���,#�����5A �ȹƱ4�cq�F�kK�8��(�l5��q�K@2���Ʊ���Z #I�Q�X"�ŵAڒo�=��V�v�k�-�6�u@r���}��.w��.F@��KX�
Iwq=Lǿf�)��._p}����� �19������	SD��8�ci9�#b`"9���p5B�'�J}�lZ���J�m��a䀄D?��U��l`�D,[���ytGK	�C���'�)A9k(��R=(��lJ>��T-�Ry�D��%RC����g�$_��H�Ƒ@�����5H#�4�.$���)�	��sA ������u)���S��<$'�=t��!����RyH>�FLAt
��!��:�K��&�D�yw�U�St\��+�HFN�,��K�Qåp�|^�$�1\��U0\�m�O@�T�F5��-�$���@#�|۠�I�j�1������M_%�F�h�l\8��Tl���]�cP1i��k��~u)4�;X�wZ���Z��*���!�3(H#e4R�1"e|�_E�H�v e(�	#1(��2M:d"��H�Ƒ2���� S���H���	)C�hK0��N9+�.6�v��쨵��ଲ�U�0�WK=����ZU�|`6L�I�W�[[�uƕ}�X�����r`@�h_�CjT�����iW���h*��^5�7�d�!��.�h��~1���Ƅ�C�B�;,��||1�^�<��;�Î�xgt�r��L'[�`X�p1�ģ��Y���hֵI0K�ВYD��ze����v�Sh0_lr��}ZOj�\�-��L�����5NQ-gz 81 C�#~L�WT��E����cW�����g\ɮ��d��Xt5	ZqŮ��Rŉ�������K\@����P�5��3m�-L�����^9�z�2׋^׮GV0v�R�`) ���VM|Ů���R=��]�6T��Hl-Q�j�B]��Pa�aҚ}����Hؓ1=@8h�TAC"���0Jv�r��)�VOͶj�a�EčqV6��?< �@y8@�|X�y�$�W��(����>H4_qN����>L�DrGg��v��B��s2, C�O:�E�E?S.�,�
*Zt����lX��[������=t����ɵ0���*/9Ч�CS�0��"Kh&,G4f�8K���\��,��>>IF��"I�Sϴ��yJ�9��_������o�?�{�V(T�`�v*P���v������<NU��Yu�{��b��2���P9@�ԆY�ffx�p��kgI�_z�y��<&&(��־m+�s�����0�ˠ$���'x���^�P7��]����t�\���*EK(���v�(!s`�=�ƶ=8�Q4m��#+��F���$/�	��x��Q OG�����Gc�[�������07q��_��+�����������0���O�ҭ�3���d2��?�}��'_9'��خ��臝K����$z�w���Y��g����!0q$H�6O��W�T��w9�A��rZ�w��6LV�;�����?���\���Ad�&�#��� Zgw�����EG���V��ٯ\N{�i��9�����'pa)'�KL4���3�)[���2�h3v0H��v"ũ�
@;����GEK��ּr�S�ryX 	v���=���|���SЁ)�?;v̉�Y�A]PG���c��f�u�@K��Y4��SZ�P���od �`�Y.=L0)] ���a�OX������z�(�a���c��c�^Z�b5ͯ;���e��-O�-|?J`V�*V'!�o��+�F�Gn��0��%����e*x�X|;�ML�:	�|#�7���}?rْܰ��F���Vp̩��&��&8�l�Qp˭�7�����<�ձ<���b��P�άZ�#�Q�8��]|��i�����,c��c(yE�b��Qe�z��0�<�(���WpT{9���S�:nj��v�j����"��4RM�Z��N���N�=���{hL�6�!�bOh���֣��V���Cp�5�� -�^Z��a��M�����g)��}���;�      '   �   x��A
�0�����NI%1��^�'d��@�UI�篖��y���;w��N�#%���v֘���o^rm��Z���5í=�z&��J�Z^ߠРϖ;r��K�N%�<`���z�6ΰW)P�Mʑ��t��rI��?vrf�c~�53      7   �   x�-��N�@E��߲�|3�0W��j,�,�~���R��}zј{s79��I��'~�\�E5�f}E�~�0�.��p���������7��.��
^w�oU�����E.�$��Z��BX'H��N�O��e��9Ԋ͹�:w�����=Lfl���0)� �[H�bFE&��>�ک"j'Wx��|XD�I�r	��<��3K���K�� l�:?�����X�4�զ�uc�)�B!�c���P      9   I   x�3�t�,JM.)-���Tv�t6�p1���D&�䠈�Qj�nh0��XZ�7O�%5-�4�$�E�+F��� p|#-      A      x������ � �      D      x������ � �      (   �  x���Qo�0ǟç����@�&M;	i�m�6�j�ڋ�8��R
���_�&M���ɖeK�_�Ϩ�2� %VJ�sDj$��$�H4�b��84eO�q�^�[�2�q��N1����f��U�l?�Ǘx:�ֿ�&ч�E��6\�?Wn���aV��t!!�Ei�>��cR�{"�ޚy-���ݬ�H�a���4�ڵQ�К��m�$,�?�Z8l������1L0ƴ�L*C�)�j=�<�Z�\���-���&pJ/��j�߁��*y�Uu���ƾڍ�b�$�%���=���0=��������h�M��r���2����?a(%�h�*�m�))hȩ�X��ڂ{j�{���,<�9�=O]�H�����������w�G����t�W�s      E      x������ � �      ;      x������ � �      K      x������ � �      G   t   x�-�A
1��_�؉�ğ����(t��cZB�1-�ÜGG�Nh�����~�>0��� �� ��.b��FM����f����I�v)�VG��kT,R�C�y���oG"     