GetBoneName(boneid, name[], name_size) {
    switch( boneid ) {
        case 1:
            strunpack(name, !"�����", name_size);
        case 2:
            strunpack(name, !"������", name_size);
        case 3:
            strunpack(name, !"����� �����", name_size);
        case 4:
            strunpack(name, !"������ �����", name_size);
        case 5:
            strunpack(name, !"����� ����", name_size);
        case 6:
            strunpack(name, !"������ ����", name_size);
        case 7:
            strunpack(name, !"����� �����", name_size);
        case 8:
            strunpack(name, !"������ �����", name_size);
        case 9:
            strunpack(name, !"����� ����", name_size);
        case 10:
            strunpack(name, !"������ ����", name_size);
        case 11:
            strunpack(name, !"������ ������", name_size);
        case 12:
            strunpack(name, !"����� ������", name_size);
        case 13:
            strunpack(name, !"����� ����������", name_size);
        case 14:
            strunpack(name, !"������ ����������", name_size);
        case 15:
            strunpack(name, !"����� �������", name_size);
        case 16:
            strunpack(name, !"������ �������", name_size);
        case 17:
            strunpack(name, !"���", name_size);
        case 18:
            strunpack(name, !"�������", name_size);
        default: {
            format(name, name_size, "�������� ����� ���� (%i)", boneid);
            return 0;
        }
    }
    return 1;
}
