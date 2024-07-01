Расписание событий в игре Perfect World

Ежа в данж высчитывается в Замкнутом линкед листе. Лист "поворачивается" нужное количество раз, 
определяемое количеством прошедших дней с 1 мая 2024.

Есть возможность добавления особых событий вроде профилактических работ или марафона,
а также изменить приветствие и тему на темную.

Используется Coordinator + MVVM. Изменяемые данные сохраняются в память устройства (CoreData)
Добавлена анимация перехода textField в положение над клавиатурой, когда поле выделено.
Таблица с особыми событиями при выделении textField сдвигается вверх для удобства.

**Памятка**
При подписывании координатора на событие во вьюшке, подписку нужно хранить не в сете AnyCancellable,
а просто в переменной "AnyCancellable?" или при ребилде вьюшки (например после перехода на другой экран), 
подписки множатся и постоянно добавляются в сет. Если просто хранить в переменной, 
то подписка всегда будет заменять старую и все будет работать нормально.


![8](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/87ada14d-5157-4a05-915a-aa2ad9b39d2d)
![7](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/25a67dc1-c10d-4022-bb5f-b455aac80561)
![6](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/63a86fac-8009-432a-bd45-1d647936b25c)
![5](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/86f3eba4-b869-4f14-b1ec-a034840be94d)
![4](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/32b1593e-8254-48e0-9f40-7f710151237d)
![3](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/bac8a9b9-6615-4a11-9eb9-a8738d806157)
![2](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/6e71e05a-9cce-4162-943d-74e1188d87ae)
![1](https://github.com/PvssPrt1998/SchedulePerfectWorld/assets/43918790/b0b3e226-7400-419c-80d3-09eaf5558e51)
