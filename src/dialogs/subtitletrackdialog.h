/*
 * Copyright (c) 2024 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef SUBTITLETRACKDIALOG_H
#define SUBTITLETRACKDIALOG_H

#include <QDialog>

class QLineEdit;
class QComboBox;

class SubtitleTrackDialog : public QDialog
{
    Q_OBJECT

public:
    explicit SubtitleTrackDialog(const QString &name, const QString &lang, QWidget *parent);
    QString getName();
    QString getLanguage();

private slots:
    void accept();

private:
    QLineEdit *m_name;
    QComboBox *m_lang;
};

#endif // SUBTITLETRACKDIALOG_H
