# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Page.delete_all
Page.create(title: 'page_1',
            description: 'desc_1',
            slug: 'slug_1',
            menu_label: 'menu_label_1_01/01/2015',
            h1: 'h1_1',
            content: 'Text_1 <strong>Strong_text_1</strong>',
            published_at: DateTime.parse("01/01/2015 8:00"),
            priority: 1)

Page.create(title: 'page_2',
            description: 'desc_2',
            slug: 'slug_2',
            menu_label: 'menu_label_2_01/01/2016',
            h1: 'h1_2',
            content: 'Text_2 <strong>Strong_text_2</strong>',
            published_at: DateTime.parse("01/01/2016 8:00"),
            priority: 2)

Page.create(title: 'page_3',
            description: 'desc_3',
            slug: 'slug_3',
            menu_label: 'menu_label_3_01/01/2017',
            h1: 'h1_3',
            content: 'Text_3 <strong>Strong_text_3</strong>',
            published_at: DateTime.parse("01/01/2017 8:00"),
            priority: 3)

Page.create(title: 'page_4',
            description: 'desc_4',
            slug: 'slug_4',
            menu_label: 'menu_label_4_01/01/2018',
            h1: 'h1_4',
            content: 'Text_4 <strong>Strong_text_4</strong>',
            published_at: DateTime.parse("01/01/2018 8:00"),
            priority: 4)

Page.create(title: 'page_5',
            description: 'desc_5',
            slug: 'slug_5',
            menu_label: 'menu_label_5_01/01/2019',
            h1: 'h1_5',
            content: 'Text_5 <strong>Strong_text_5</strong>',
            published_at: DateTime.parse("01/01/2019 8:00"),
            priority: 5)
